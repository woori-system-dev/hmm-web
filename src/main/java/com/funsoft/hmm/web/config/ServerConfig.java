package com.funsoft.hmm.web.config;

import java.util.concurrent.ThreadPoolExecutor;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.core.task.TaskExecutor;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;

import com.funsoft.hmm.netty.cdma.handler.CdmaServerChannelInitializer;
import com.funsoft.hmm.netty.cdma.handler.CdmaServerHandler;
import com.funsoft.network.NioTcpServer;

import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;

@Configuration
@EnableScheduling
@EnableAsync
public class ServerConfig implements SchedulingConfigurer {

	@Bean(destroyMethod = "shutdown")
	public TaskScheduler scheduler() {
		ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
		scheduler.setPoolSize(10);

		return scheduler;
	}

	@Bean(destroyMethod = "shutdown")
	public TaskExecutor executor() {
		ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
		executor.setCorePoolSize(60);
		executor.setMaxPoolSize(100);
		executor.setQueueCapacity(100);
		executor.setRejectedExecutionHandler(new ThreadPoolExecutor.AbortPolicy());
		
		return executor;
	}
	
	@Bean
	public EventLoopGroup bossGroup() {
		return new NioEventLoopGroup(1);
	}
	
	@Bean
	public EventLoopGroup workerGroup() {
		return new NioEventLoopGroup();
	}

	@Override
	public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
		taskRegistrar.setTaskScheduler(scheduler());
	}

	@Configuration
	public static class CdmaServerConfig {

	    @Resource(name = "bossGroup")
	    private EventLoopGroup bossGroup;
	    
	    @Resource(name = "workerGroup")
	    private EventLoopGroup workerGroup;
	    
	    @Value("${tcp.local.ip}")
		private String tcpIp;
	    
	    @Value("${tcp.local.cdma.port}")
		private int tcpPort;
		
		@Bean
		@Scope("prototype")		
		public CdmaServerHandler cdmaServerHandler() {
			return new CdmaServerHandler();
		}

		@Bean
		public CdmaServerChannelInitializer usnServerChannelInitializer() {
			return new CdmaServerChannelInitializer();
		}
		
		@Bean(destroyMethod = "close")
		public NioTcpServer usnTcpServer() {
			NioTcpServer tcpServer = new NioTcpServer();
			tcpServer.setBossGroup(bossGroup);
			tcpServer.setWorkerGroup(workerGroup);
			tcpServer.setLocalIP(tcpIp);
			tcpServer.setLocalPort(tcpPort);
			tcpServer.setChannelInitializer(usnServerChannelInitializer());
			tcpServer.init();
			return tcpServer;
		}
	}
}

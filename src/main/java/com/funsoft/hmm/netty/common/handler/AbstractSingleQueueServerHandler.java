package com.funsoft.hmm.netty.common.handler;


public abstract class AbstractSingleQueueServerHandler<I, O> extends AbstractServerHandler<I, O> {

	@Override
	protected Integer syncQueueKeyByAckMessage(I packet) {
		return 1;
	}

	@Override
	protected Integer makeSyncQueueKey(O packet) {
		return 1;
	}

}

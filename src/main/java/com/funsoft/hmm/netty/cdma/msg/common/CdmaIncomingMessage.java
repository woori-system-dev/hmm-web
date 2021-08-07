package com.funsoft.hmm.netty.cdma.msg.common;

import com.funsoft.hmm.netty.common.msg.IncomingMessage;

public interface CdmaIncomingMessage extends IncomingMessage<CdmaMessageType> {

	CdmaMessageHeader getHeader();
	
}

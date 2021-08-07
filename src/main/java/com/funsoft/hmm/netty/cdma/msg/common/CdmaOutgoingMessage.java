package com.funsoft.hmm.netty.cdma.msg.common;

import com.funsoft.hmm.netty.common.msg.OutgoingMessage;

public interface CdmaOutgoingMessage extends OutgoingMessage<CdmaMessageType> {

	int getRequireBodySize();

}

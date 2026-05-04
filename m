Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KSiLpyz+GkdzAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 04 May 2026 16:56:28 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D61D4C03D7
	for <lists+greybus-dev@lfdr.de>; Mon, 04 May 2026 16:56:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08E3F409B4
	for <lists+greybus-dev@lfdr.de>; Mon,  4 May 2026 14:56:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 2CECE405DC
	for <greybus-dev@lists.linaro.org>; Mon,  4 May 2026 14:56:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=MyayezfJ;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8863440D5;
	Mon,  4 May 2026 14:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D268C2BCC4;
	Mon,  4 May 2026 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777906580;
	bh=OMa+PW8rNJuqoeSB6MroRicoWmkA5SOqhlT+psuymAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyayezfJxOwY/vkKj8u/Uz4Cc+cFl7REfktW47Oqs33JRMLvvGo4D58JrJmhg4Evh
	 YkHyH4UNBMpyhStgJs+k8Kt4MVT7I/vk7SXN19+6ggyl+NEyvIqILXFftLiERzhwPj
	 qp1J7taGQaRgvMJ2XEItUvO0gJoBNSejyfOxugZk=
Date: Mon, 4 May 2026 16:15:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
Message-ID: <2026050413-smell-ramp-e2a6@gregkh>
References: <2026042618-whole-cassette-b15e@gregkh>
 <20260427045446.16430-1-debjeetbanerjee48@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260427045446.16430-1-debjeetbanerjee48@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: QOWWEMXEIZQQSOSXVXWTXMVOKB5ROXRF
X-Message-ID-Hash: QOWWEMXEIZQQSOSXVXWTXMVOKB5ROXRF
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: uart: clear unsupported c_cflag bits in set_termios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QOWWEMXEIZQQSOSXVXWTXMVOKB5ROXRF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5D61D4C03D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.056];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,vger.kernel.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]

On Mon, Apr 27, 2026 at 10:24:46AM +0530, Debjeet Banerjee wrote:
> gb_tty_set_termios() derives UART line configuration from a subset of
> termios->c_cflag bits (CSIZE, CSTOPB, PARENB, PARODD, CMSPAR, CRTSCTS,
> CLOCAL and CBAUD). Other bits are not interpreted by the driver and are
> not represented in the Greybus UART protocol.
> 
> Mask unsupported c_cflag bits so that userspace-visible termios
> reflects the supported bits implemented by the driver.
> 
> This addresses the existing FIXME.
> 
> Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
> ---
> v2:
>   - Clear unsupported c_cflag bits as suggested
>   - Update comment to mention the change

Has this been tested?  If not, I'd prefer to leave this as-is until it
can be.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

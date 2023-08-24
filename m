Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C251878674F
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Aug 2023 08:03:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C3F8A43F03
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Aug 2023 06:03:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id BBBF73EC22
	for <greybus-dev@lists.linaro.org>; Thu, 24 Aug 2023 06:03:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=yinMnJJ5;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45C8963466;
	Thu, 24 Aug 2023 06:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E61C433C8;
	Thu, 24 Aug 2023 06:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692857027;
	bh=0VyVeVFbgJTPwWE317XkoOj0pt6l9LCT/ooWkDEt2ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yinMnJJ5AZtyfJUrkmLZu8+WgGSTgldgA+FqRsJDOcg/GIXC7JDJFXSqOUURxoMBT
	 uSgsAKE2+FV8dpfR72J5OeoLH3BRzSRzBFkBUWQ2Qz99monYOmSKDvrx4j7u5Fc0Ng
	 FsLB/+Vfwu5ldmjnQgG6p8I9c9faz78UhG48q3oc=
Date: Thu, 24 Aug 2023 08:03:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <2023082452-reflex-nuclear-cb7f@gregkh>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
 <20230823165520.181301-4-ayushdevel1325@gmail.com>
 <2023082307-untapped-automatic-ec5f@gregkh>
 <ebf72b7e-61b7-5592-8b8d-865ffc5c3e82@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebf72b7e-61b7-5592-8b8d-865ffc5c3e82@gmail.com>
X-Rspamd-Queue-Id: BBBF73EC22
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com,kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: VJ4H64MG6HP5QHTSQRCMXORLQWAIFJDD
X-Message-ID-Hash: VJ4H64MG6HP5QHTSQRCMXORLQWAIFJDD
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/4] Add HDLC helper for beagleplay driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VJ4H64MG6HP5QHTSQRCMXORLQWAIFJDD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 24, 2023 at 11:21:26AM +0530, Ayush Singh wrote:
> > And to answer this question, no, it probably shouldn't be here in
> > drivers/staging/ it should be in the "real" part of the kernel as it is
> > a real driver.  drivers/staging/ is for stuff that still needs work to
> > do to get it out of that part of the kernel, do the work ahead of time
> > and then you don't have to mess with that at all.
> 
> What do you mean by "real" part of kernel? You mean non-staging? The HDLC module/code initially started out as a part of beagleplay greybus driver (which started from wpanusb [1]). I separated it out since it should be possible to use it from other drivers which need async HDLC framing, but I am not sure how suitable it is to be used outside of UART. Thus, I do not feel it should be outside staging for now.
> 
> > No need for a .h file for a simple .c file, just put it all together
> > into one file please.
> 
> Well, it is not really a standalone driver. It is supposed to be used by some other driver (like serdev) to stack HDLC on top of that. So I think it needs .h file?
> 
> > > +int hdlc_rx(struct hdlc_driver *drv, const unsigned char *data, size_t count)
> > Why is this a global function?
> 
> These functions are called by any driver that wants to stack HDLC on top of the underlying transport. The HDLC files themselves can only read an HDLC frame or create an HDLC frame. It does not really care much about the underlying transport
> 
> I absolutely wish to make it clear that all the HDLC code can be put in beagleplay greybus driver (that's how it began). I just thought it might be better to separate it out for clarity and possibly allowing future drivers to use it for async HDLC framing.

Worry about future drivers then, in the future.  We write kernel code
for today, for what is needed today, and if you want to reuse anything
later, wonderful, the code can be changed then to do so.  But never make
anything more complex today than it has to be.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

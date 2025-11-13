Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CEDC593E6
	for <lists+greybus-dev@lfdr.de>; Thu, 13 Nov 2025 18:44:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3874E3F851
	for <lists+greybus-dev@lfdr.de>; Thu, 13 Nov 2025 17:44:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 938D83F70E
	for <greybus-dev@lists.linaro.org>; Thu, 13 Nov 2025 17:44:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=SxKqehLY;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39DA1600C4;
	Thu, 13 Nov 2025 17:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1378C4CEF1;
	Thu, 13 Nov 2025 17:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763055879;
	bh=SyXQes28BrMHDYFJjh2EyZrY74SxZFP6LaB9NpHOKu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxKqehLYu0J05748WZVIpO/JK4Q8wvEIUIv1OdbBxjkNJZ1Td4J2Qr8NNmYnWUhGq
	 jyz1BrAgKxxLsCwqowATCG204ZhoWsgydMFgvo+nRtnewD0VgXUndfUKaC978+qCik
	 olnxh7hxfasKe5oOtI84rQHv8vszMmPaci5w7SjM=
Date: Thu, 13 Nov 2025 12:44:38 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chang Junzheng <guagua210311@qq.com>
Message-ID: <2025111323-icon-reopen-834c@gregkh>
References: <tencent_3725607DD617A567779DEB1BEC7C3B335208@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_3725607DD617A567779DEB1BEC7C3B335208@qq.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 938D83F70E
X-Spamd-Bar: ++
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[qq.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,vger.kernel.org,outlook.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Spam-Level: **
Message-ID-Hash: FTOG7WZSJ7QAO7UF3WFNTTYMQR6RY3DN
X-Message-ID-Hash: FTOG7WZSJ7QAO7UF3WFNTTYMQR6RY3DN
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Chang Junzheng <guagua210311@outlook.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio_manager_module: make envp array static const
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FTOG7WZSJ7QAO7UF3WFNTTYMQR6RY3DN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 13, 2025 at 10:12:00PM +0800, Chang Junzheng wrote:
> From: Chang Junzheng <guagua210311@outlook.com>
> 
> Fix checkpatch.pl warning by changing envp array declaration to
> static const char * const. This improves code safety and follows
> kernel coding style recommendations.
> 
> Signed-off-by: Chang Junzheng <guagua210311@qq.com>
> Changes in v2:
> - Restored original indentation of array elements
> - Only changed the array declaration as originally intended

The "Changes" goes below the --- line, as per the documentation.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

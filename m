Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70F8A6298
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Apr 2024 06:49:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7CF8C4109C
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Apr 2024 04:49:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 6CE5540B72
	for <greybus-dev@lists.linaro.org>; Tue, 16 Apr 2024 04:49:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=TSIOHs1T;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8D626108E;
	Tue, 16 Apr 2024 04:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789F6C113CE;
	Tue, 16 Apr 2024 04:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713242988;
	bh=aHDljlWTmUinNNo0sb6wTvxH2kECa12PPEoAt9mZth0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSIOHs1Tb3oLK0FC+dgPNoBUMjt45XzbszoTX1iqwX7dSALlE1T/PSBsHVx3+Mov9
	 QJiL1veeM0fnyNKIGBM5NbwrCjmoAmdgvpBoDypBx01wiRzLQu8qxgPq4nZOZJP0Tu
	 CtWmSeXNIfsK/iV7J7V+Byj/spCAfz7j+oU+llRg=
Date: Tue, 16 Apr 2024 06:49:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: sicong <congei42@163.com>
Message-ID: <2024041624-oxford-sabbath-9f6a@gregkh>
References: <280ee5e5.4936.18ee4d93bae.Coremail.congei42@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <280ee5e5.4936.18ee4d93bae.Coremail.congei42@163.com>
X-Rspamd-Queue-Id: 6CE5540B72
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	URIBL_BLOCKED(0.00)[dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: XHQIFGC3XAVYIOMFPOJGQFFRWZ5NLDZL
X-Message-ID-Hash: XHQIFGC3XAVYIOMFPOJGQFFRWZ5NLDZL
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: Bug report: greybus/interface.c: use-after-free bug in gb_interface_release due to race condition
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XHQIFGC3XAVYIOMFPOJGQFFRWZ5NLDZL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 16, 2024 at 11:00:25AM +0800, sicong wrote:
> greybus/interface.c: use-after-free bug in gb_interface_release due to
> race condition.
> 
> In gb_interface_create, &intf->mode_switch_completion is bound with 
> gb_interface_mode_switch_work. Then it will be started by 
> gb_interface_request_mode_switch. Here is the code.
> if (!queue_work(system_long_wq, &intf->mode_switch_work)) {
> 	...
> }
> 
> If we call gb_interface_release to make cleanup, there may be an 
> unfinished work. This function will call kfree to free the object 
> "intf". However, if gb_interface_mode_switch_work is scheduled to 
> run after kfree, it may cause use-after-free error as 
> gb_interface_mode_switch_work will use the object "intf". 
> The possible execution flow that may lead to the issue is as follows:
> 
> CPU0                            CPU1
> 
>                             |   gb_interface_create
>                             |   gb_interface_request_mode_switch
> gb_interface_release        |
> kfree(intf) (free)          |
>                             |   gb_interface_mode_switch_work
>                             |   mutex_lock(&intf->mutex) (use)   
> 
> This bug may be fixed by adding the following code before kfree.
> cancel_work_sync(&intf->mode_switch_work);

Wonderful, please submit a patch with this information and we will be
glad to review it.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

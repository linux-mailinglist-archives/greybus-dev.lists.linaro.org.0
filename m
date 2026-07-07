Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IUEaDq/ATGq5pAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 07 Jul 2026 11:02:39 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE671977F
	for <lists+greybus-dev@lfdr.de>; Tue, 07 Jul 2026 11:02:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=Mw+DB3MT;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 635E440A86
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jul 2026 09:02:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 695D23F720
	for <greybus-dev@lists.linaro.org>; Tue,  7 Jul 2026 09:02:32 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C04F2417D9;
	Tue,  7 Jul 2026 09:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA201F000E9;
	Tue,  7 Jul 2026 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783414951;
	bh=iyzS887MStQRxqJO3VlrvtpEmCU5l1Z3IuKzwc+5k6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mw+DB3MTNW6eQH4jFsv6YdSN1F4PMRNbtPR9/f0LqyKo/IkTwHwi/O0Eo8BkMN/cC
	 V4v53jbRu7+cZ6qI4GgOaEb1xcJZSSUd10V0gGKfHOwPHjsncaxOD71aI1jv6WMMDI
	 qd5eEXRfHWvJBGE5g285q5I9XFB2/U3/PVsR3gO8=
Date: Tue, 7 Jul 2026 11:02:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Message-ID: <2026070752-maggot-corrosive-265d@gregkh>
References: <20260625061208.30279-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260625061208.30279-1-pengpeng@iscas.ac.cn>
X-Spamd-Bar: /
Message-ID-Hash: U644IXQHOJ56W2UAM5LTSKSQGMM664WC
X-Message-ID-Hash: U644IXQHOJ56W2UAM5LTSKSQGMM664WC
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [RFC] staging: greybus: arche still depends on missing USB3613 provider
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/U644IXQHOJ56W2UAM5LTSKSQGMM664WC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:hvaibhav.linux@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:hvaibhavlinux@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gregkh:mid,linuxfoundation.org:from_mime,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CEE671977F
X-Spam: Yes

On Thu, Jun 25, 2026 at 02:12:08PM +0800, Pengpeng Hou wrote:
> Hi,
> 
> while auditing conditional provider/header contracts, I noticed that Greybus
> Arche still appears to describe a USB3613 provider world that is absent from
> current mainline.
> 
> drivers/staging/greybus/Kconfig still has:
> 
> depends on USB_HSIC_USB3613 || COMPILE_TEST
> 
> and drivers/staging/greybus/arche-platform.c still conditionally includes
> the USB3613 header and calls usb3613_hub_mode_ctrl() when
> CONFIG_USB_HSIC_USB3613 is enabled.  However, the current tree does not appear
> to provide include/linux/usb/usb3613.h or a Kconfig provider for
> USB_HSIC_USB3613.
> 
> I am not sending a patch yet because this is staging/hardware policy sensitive.
> The possible directions seem to be:
> 
> 1. restore or move the USB3613 provider/header if the hardware path is still
>    intended;
> 2. remove the stale USB3613 integration path and rely on the local stub;
> 3. change the Kconfig dependency to describe only current supported worlds; or
> 4. keep the contract if an out-of-tree provider is intentionally expected.
> 
> Could you advise which direction is expected for Arche?

I would just leave it as-is for now.  Hopefully once the greybus code
for the beaglebone devices gets more integrated we can get all of this
code out of staging, which will delete the unused stuff properly.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

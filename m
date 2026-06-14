Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tSvbIopJLmp7sgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 14 Jun 2026 08:26:18 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 1228D68079A
	for <lists+greybus-dev@lfdr.de>; Sun, 14 Jun 2026 08:26:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=xNVfOH2z;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F05284098E
	for <lists+greybus-dev@lfdr.de>; Sun, 14 Jun 2026 06:17:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 2F6E83F96F
	for <greybus-dev@lists.linaro.org>; Sun, 14 Jun 2026 06:17:00 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BED3860132;
	Sun, 14 Jun 2026 06:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51741F000E9;
	Sun, 14 Jun 2026 06:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781417819;
	bh=QhrrSv7+L/wtrm3S9Xq9MeuOnyrapERYSLT899yp4JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xNVfOH2zmYFruH3V/pCvbfwwywc9Vsq+x8xr25pLoDonWLSBR/aCmFEKKNPoziYwH
	 09+mQUcOJwNlnuhxQ0luLNSG+jS4hbj/l39/JEGCaEEjhCw30YiVxWJ8MVB39EHFsD
	 sxBsN6TQHR05DR8SyYtkq3zIDAAbiagSzpx9nxm4=
Date: Sun, 14 Jun 2026 08:15:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: abdelnasser hussein <abdelnasserhussein11@gmail.com>
Message-ID: <2026061419-bunkmate-cinch-b506@gregkh>
References: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260614060857.15366-1-abdelnasserhussein11@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: RFZZFFYLJYLODKJUHANRQYFV3V76XGIQ
X-Message-ID-Hash: RFZZFFYLJYLODKJUHANRQYFV3V76XGIQ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: check sscanf() result directly
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RFZZFFYLJYLODKJUHANRQYFV3V76XGIQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:abdelnasserhussein11@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:lkp@intel.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:from_mime,gregkh:mid,intel.com:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1228D68079A

On Sun, Jun 14, 2026 at 09:08:57AM +0300, abdelnasser hussein wrote:
> Smatch warns:
> 
>   drivers/staging/greybus/audio_codec.c:335 gbaudio_module_update()
>   warn: sscanf doesn't return error codes
> 
> sscanf() returns the number of successfully matched input items, not a
> negative error code. Compare the return value directly with the expected
> number of conversions instead of storing it in ret as an error code.
> 
> Also remove the redundant else-if check for snd_soc_dapm_aif_out. The
> widget id is validated earlier in the function, so the remaining branch
> can only handle snd_soc_dapm_aif_out. This avoids a compiler warning
> about a potentially uninitialized variable.

When you say "also" that implies it should be a separate patch.

> 
> Reported-by: kernel test robot <lkp@intel.com>

lkp didn't report the smatch warning :(

> Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/
> 
> Signed-off-by: abdelnasser hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

No list of what changed from previous versions?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

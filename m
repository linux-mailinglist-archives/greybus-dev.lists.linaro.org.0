Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENQTOgZAh2nVVQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Feb 2026 14:37:10 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FF210600E
	for <lists+greybus-dev@lfdr.de>; Sat, 07 Feb 2026 14:37:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B3534015B
	for <lists+greybus-dev@lfdr.de>; Sat,  7 Feb 2026 13:37:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id F118C3F7F8
	for <greybus-dev@lists.linaro.org>; Sat,  7 Feb 2026 13:37:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=hSQWXxID;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 595236001A;
	Sat,  7 Feb 2026 13:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1F7C116D0;
	Sat,  7 Feb 2026 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770471425;
	bh=waKnZAx8r2jfxT0C3bCF7x9i3QOM+h3W8d2dJAz2chM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSQWXxIDRmSWotArOir94dF4HwQSFU8WwujJ1a5lhv81otNTsOx/OnxSN1Ghp3J6z
	 KUM/6O+vq/3MlQ1tHHtMKersiviqi/XvDPi5d0Qt7Z8b+ek6chk7W4nnUgDELpXPPu
	 B+U/QWYV1ze1hBr6B3SjtCzvz6rPDb7aMI3STxks=
Date: Sat, 7 Feb 2026 14:37:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Neel Bullywon <neelb2403@gmail.com>
Message-ID: <2026020730-superhero-secrecy-877a@gregkh>
References: <20260205033408.86340-1-neelb2403@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205033408.86340-1-neelb2403@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: XDTDQLQD75BDLDZZZNK6SLFKTFC3AMMM
X-Message-ID-Hash: XDTDQLQD75BDLDZZZNK6SLFKTFC3AMMM
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] [PATCH v3] staging: greybus: gbphy: Replace sprintf() with sysfs_emit()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XDTDQLQD75BDLDZZZNK6SLFKTFC3AMMM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 72FF210600E
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 10:34:08PM -0500, Neel Bullywon wrote:
> Replace sprintf() with sysfs_emit() in the protocol_id_show() sysfs
> attribute function. This code is safe as-is, but replace
> sprintf() with sysfs_emit() because we are trying to get rid of calls
> to sprintf() as part of kernel hardening; sysfs_emit() is more
> appropriate in this context.
> 
> Signed-off-by: Neel Bullywon <neelb2403@gmail.com>
> ---
> This was compile-tested only (no VM/hardware used)
> 
> Changes in v2:
> - Subject: change to imperative "Replace" (was "Replaced").
> - Wording and line breaks adjusted in the commit body for clarity.
> 
> Changes in v3:
> - Clarify what "safe" means (buffer is PAGE_SIZE) per Dan Carpenter's
>   suggestion.
> - Reflow lines to avoid awkward breaks.
> ---
>  drivers/staging/greybus/gbphy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
> index 60cf09a302a7..55f132b09cee 100644
> --- a/drivers/staging/greybus/gbphy.c
> +++ b/drivers/staging/greybus/gbphy.c
> @@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
>  {
>  	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
>  
> -	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
> +	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);

For new sysfs files, using sysfs_emit() is fine, but for existing ones,
using sprintf() is also ok, just leave them as-is please.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

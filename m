Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P2hCEPGDmqzCAYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 10:45:55 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0AB5A15A3
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 10:45:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D0C4C40986
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 08:38:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 430D64097E
	for <greybus-dev@lists.linaro.org>; Thu, 21 May 2026 08:38:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=WM0TDwlY;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FF09445A2;
	Thu, 21 May 2026 08:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177731F00A3E;
	Thu, 21 May 2026 08:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779352689;
	bh=7BMXjlF7UCgxRCz0l9h6V5mLh+8r2F04IBr4+wMNLtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WM0TDwlYSBVmtRPNoSzVp9m/ADnl/Smn/+5Vwz72CHkUP2f1SHEqWPFOJ+NXvrQo4
	 fV9M+cxxy5ykvVlL+8H/+SxRxAf1U0ONE2W8iFu/rKuY/ivqLKHpNai4ykLAF5iujl
	 ugkbUzrYZVZRmbn0jcnanUlg7nq8gdEWVBeZXERU=
Date: Thu, 21 May 2026 10:38:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <2026052158-willing-dreadful-857b@gregkh>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260520180401.539215-3-grandmaster@al2klimov.de>
X-Spamd-Bar: /
Message-ID-Hash: 6VQ3C7JZG6G44PBMVZZZDEPMZFXXXNN6
X-Message-ID-Hash: 6VQ3C7JZG6G44PBMVZZZDEPMZFXXXNN6
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Elise Lennion <elise.lennion@gmail.com>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6VQ3C7JZG6G44PBMVZZZDEPMZFXXXNN6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.935];
	DBL_BLOCKED_OPENRESOLVER(0.00)[al2klimov.de:email,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Queue-Id: AE0AB5A15A3
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Wed, May 20, 2026 at 08:03:59PM +0200, Alexander A. Klimov wrote:
> kstrtoint() returns "0 on success, -ERANGE on overflow
> and -EINVAL on parsing error". In contrast,
> manager_sysfs_remove_store() and manager_sysfs_dump_store()
> checked for 1 which always failed the operation. I fixed this.
> 
> Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
> index fcd518f9540c..581791d566e3 100644
> --- a/drivers/staging/greybus/audio_manager_sysfs.c
> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
> @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
>  
>  	int num = kstrtoint(buf, 10, &id);
>  
> -	if (num != 1)
> +	if (num != 0)

Doesn't checkpatch now complain about this?

>  		return -EINVAL;
>  
>  	num = gb_audio_manager_remove(id);
> @@ -65,7 +65,7 @@ static ssize_t manager_sysfs_dump_store(struct kobject *kobj,
>  
>  	int num = kstrtoint(buf, 10, &id);
>  
> -	if (num == 1) {
> +	if (num == 0) {

Same here.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

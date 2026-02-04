Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OI/ROW8Zg2n+hgMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 11:03:27 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7C5E43AD
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 11:03:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8882A3F99C
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 09:53:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 4E1D23F750
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 09:53:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=fRSQNsbN;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8864600C3;
	Wed,  4 Feb 2026 09:53:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF89C16AAE;
	Wed,  4 Feb 2026 09:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770198819;
	bh=QF/Iu7L8vFPkGs4Cf0JcaFtCVVT1sYt+mMFrelSWkFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fRSQNsbNmNBzjhi3V/LJfE3AwvKDO40J3f2B+/omgY1auQBDAoG9dJzcmN1AT6BHu
	 fygA5BKY+mu3AcDBNGs/Hup2zAaazAyOPzWV30jWD4YXLO5e04E/n3tzkObVkQv1qO
	 FqnMDx6X0JwEFRcPlOHiEsk+zE7+a3MZ55UXQxtE=
Date: Wed, 4 Feb 2026 10:53:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Eitan Collett <eitan.collett@gmail.com>
Message-ID: <2026020400-unopposed-graffiti-5657@gregkh>
References: <aYCnemXK-f6Htojh@fakie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYCnemXK-f6Htojh@fakie>
X-Spamd-Bar: /
Message-ID-Hash: 6IWRRHPZLY77OEYCAOECQFZW24R5TODT
X-Message-ID-Hash: 6IWRRHPZLY77OEYCAOECQFZW24R5TODT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_codec.c: Remove unnecessary parentheses in if statement
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6IWRRHPZLY77OEYCAOECQFZW24R5TODT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.59 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.993];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 7E7C5E43AD
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, Feb 02, 2026 at 03:32:42PM +0200, Eitan Collett wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Unnecessary parentheses around 'w->id != snd_soc_dapm_aif_in'
> CHECK: Unnecessary parentheses around 'w->id != snd_soc_dapm_aif_out'
> 
> Signed-off-by: Eitan Collett <eitan.collett@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 444c53b4e08d..44aee8268d14 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
>  	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
>  		enable ? "Enable" : "Disable");
>  
> -	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
> +	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {

I hate this checkpatch "warning" sorry.  Now you need to go and try to
remember if && is higher priority than !=, right?

Please just leave this as-is.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

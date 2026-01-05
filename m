Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA5CF20D9
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 07:21:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BEE2400F2
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 06:21:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 9C7B73F6E3
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 06:21:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=l32S8+G6;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18867434AE;
	Mon,  5 Jan 2026 06:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD8CC116D0;
	Mon,  5 Jan 2026 06:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767594076;
	bh=BIuzz/EPuN1+s7QUbl6KSoA/jInW8sw3qTTl6xlEblk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l32S8+G6h/VipSFVClsplOT3oPilCpLTJLVwXnT0FbAcRZSQA9NWrJFcFTM4Djxt+
	 fBNEvHMwfUdjToddyqdEPw58JbqFSbWH0H4k+yT9syFrrWamNXwNYKVUaBa7fd3oUX
	 TOInkuWAF1wkbiwAc9udzOGMkf6fAtB9vTAYFwVg=
Date: Mon, 5 Jan 2026 07:21:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gideon Adjei <gideonadjei.dev@gmail.com>
Message-ID: <2026010547-slacks-comic-bc68@gregkh>
References: <20260104132541.17989-1-gideonadjei.dev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104132541.17989-1-gideonadjei.dev@gmail.com>
X-Rspamd-Queue-Id: 9C7B73F6E3
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[gregkh:mid,sea.source.kernel.org:helo,sea.source.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 2BJIZSZTCX6EW47WAH7FGF7XGKABCS6C
X-Message-ID-Hash: 2BJIZSZTCX6EW47WAH7FGF7XGKABCS6C
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: replace WD_STATE_COLDBOOT_TRIG with state
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2BJIZSZTCX6EW47WAH7FGF7XGKABCS6C/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jan 04, 2026 at 05:25:41AM -0800, Gideon Adjei wrote:
> use state temporary variable to replace WD_STATE_COLDBOOT_TRIG argument
> in arche_platform_set_wake_detect_state. This keeps lines under 80
> columns and satisfies kernel style guidelines.
> 
> Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
> ---
>  drivers/staging/greybus/arche-platform.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index 8aaff4e45660..bb9b3c3c7a2d 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -155,6 +155,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  {
>  	struct arche_platform_drvdata *arche_pdata = devid;
>  	unsigned long flags;
> +	int state;
>  
>  	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
>  
> @@ -179,8 +180,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>  				 */
>  				if (arche_pdata->wake_detect_state !=
>  						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +					state = WD_STATE_COLDBOOT_TRIG;
> +					arche_platform_set_wake_detect_state(arche_pdata, state);

No, sorry, the original code here is just fine, don't do things like
this just to make checkpatch "quiet".

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

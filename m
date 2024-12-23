Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE249FB3C9
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Dec 2024 19:05:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DB6A344836
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Dec 2024 18:05:45 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id DDA163EA17
	for <greybus-dev@lists.linaro.org>; Mon, 23 Dec 2024 18:05:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=up2pegsY;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62F09A40C54;
	Mon, 23 Dec 2024 18:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6C4C4CED3;
	Mon, 23 Dec 2024 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734977138;
	bh=nBM5cD9bxkmfcYVcW9x+AfW5SCErHBeFWpVZ+h5BUS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=up2pegsYpcxKMlPlL2tBbC3dpZcbQYlMHk7Pco8LdHZv0TjB+iXejvFzxNm2lv/yQ
	 JK3/Nwpu7YIAXAKRssjKDAcz7PExQJE3NwGObLPH0osjrsvHpa4QmqtfBjnmYrw7/6
	 y1mItBILIQZq4NH3TqIrt1YibGNt/0rfEqsK8UyI=
Date: Mon, 23 Dec 2024 19:05:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Message-ID: <2024122358-vexingly-broadly-7df7@gregkh>
References: <20241223151112.206908-1-evepolonium@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241223151112.206908-1-evepolonium@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DDA163EA17
X-Spamd-Bar: --
X-Spamd-Result: default: False [-3.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[nyc.source.kernel.org:helo,nyc.source.kernel.org:rdns,linuxfoundation.org:dkim];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: BYWG3R7BLZHMPKKK3XQCFCRRGZ4W6QUW
X-Message-ID-Hash: BYWG3R7BLZHMPKKK3XQCFCRRGZ4W6QUW
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Remove module from list before freeing in gb_audio_module_release
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BYWG3R7BLZHMPKKK3XQCFCRRGZ4W6QUW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 23, 2024 at 08:41:12PM +0530, Atharva Tiwari wrote:
> Previously,the module was freed without detaching it from the list which could lead to memory leak
> this patch uses list_del to safely remove the module from the list
> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 4a4dfb42f50f..7e52c3f95692 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -69,7 +69,8 @@ static void gb_audio_module_release(struct kobject *kobj)
>  	struct gb_audio_manager_module *module = to_gb_audio_module(kobj);
>  
>  	pr_info("Destroying audio module #%d\n", module->id);
> -	/* TODO -> delete from list */
> +	if (module->list.prev && module->list.next)

For lists, you really shouldn't poke around in the prev and next
pointers, right?

Have you tested this?  This feels like an odd change, is it a real
system that is using this code anymore?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

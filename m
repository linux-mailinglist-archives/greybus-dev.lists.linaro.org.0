Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UtuzNg3JQ2pqhwoAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 15:47:57 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7846E5055
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 15:47:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=YQkRxtqJ;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6362840AF5
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 13:47:56 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	by lists.linaro.org (Postfix) with ESMTPS id 9EF4740AA9
	for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 12:13:37 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4896ae35be9so1908479b6e.0
        for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 05:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782821617; x=1783426417; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIdV6zIifVX8xXJTc1qP/yM+e/D3Xonrexw/DMWskVo=;
        b=YQkRxtqJmk0NAjYtg/I2jfmp6PZoznf5IxW4kphKyFpX58hIWegSw3e/tsNdiwcmc5
         xkag+vEZafnYHzX6/PCpg/oF+aaFkvKQZ9XbkNeoJr2vjWOsqiUWBHP3A4qWE/z133zX
         gabVqx53TpKDE1PimeIK2c9zYgTBsqNJDHZHuWeGYz8E/wL2iGE8Y72izLP6UrddUaeg
         2Oj4+0rdOzZxvnZBswZu8qHq1N699+yPobEC8MDtJEm4Jx85FSP2kRlRRdwEyc4b35LJ
         sJv4F9dmc9BQGie38iNpCJGysNcosqxjFa5bJLppdidA0rpQ6EE5Y2NkquWdFjn3s0aK
         pgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821617; x=1783426417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIdV6zIifVX8xXJTc1qP/yM+e/D3Xonrexw/DMWskVo=;
        b=gCPNaYgFweHLzuDZdCxoTdQYw6Lo+uJNG2BJrn/NmLqwOA6AEIYHxeagBDtOEv8s78
         vcWsCkmWcjSPv2sI6T8HfapwdqAgzvwf3hhUs7vaKzx0ekjPqW2YDVsHWyeaHbhjn6cI
         P2DwAZkpJNX1pYnMvYlK3Fii3tSyAxx5kegWGWaXdKBq/sclWsurfWrCINlQ/5KFjX5V
         ptWg5Yo7dyDOBdVhpsD5cP0SNcBh2tdLULvcbEvLzIFIfw7AXN6Tgc2rWGoEGJ9qN5Ij
         NQS13GvKpSoG/m7BdhMBBq17yf75rEfqc0VzeMn/nzhkh9Nfvb2neFlSnYez2/eOE1ou
         UtGg==
X-Forwarded-Encrypted: i=1; AFNElJ/+n6MKFO3SGQze7cD316nZLg+cP5bAILpKYT2/Gtl7Fw+nIAFzoWc8AdpgN1wGDLKRCwYOBTXhZ42siw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwoOhJTy3RruuacChsZmL7u4SUBXNPcWaB86hxq+QiKu5yrWA0H
	ybWBuoakE4FE1mBECr4tunEu2z/BE+N98O1aN3CdkQRCA2aPev2koTA6
X-Gm-Gg: AfdE7cmhjAsv0VRAHGUYDUNg+5lIJckGZific0juayV8wIJmLHgvoD3hnNngiKCb4Tx
	YGglZrkMHzuzymzz/yUjd7vJijqBm1Gr4fsqReo6Z5iXqnrBRf9QFqqhokfvBf2nQWZ0BcLV73M
	4vnjfF5gmxXl32gJWFC+hGd96fD+4td8+g3zZyH+QdVwMDDLW2MGaw8o1dZJFnH1lZ6M20ndD+f
	E5+SmlQZWybuZv3CYuU6ZKGprX9JYjacSRB5ECZ0Fy2mtXGaRFPsy3bJK8XPiBLtSz/Ma1idl95
	ftZV2OjPyOuT76Qz05or9zORokt18axLGlNoeKw0ASvQybWs3VILmDh6x3KeNmyX3t0GQS5se7h
	mMApvannjQQ59hStLu5fi5nuhhXAKhUkSp+Imwu+sOgaetlY04RaWEvvgVZgxStg1f9bWgufWD1
	QFGHUE1w==
X-Received: by 2002:a05:6808:318e:b0:489:6c24:9d26 with SMTP id 5614622812f47-495fd72d80dmr81857b6e.27.1782821616728;
        Tue, 30 Jun 2026 05:13:36 -0700 (PDT)
Received: from localhost ([74.80.182.100])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-49354e517dfsm8484496b6e.11.2026.06.30.05.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:13:34 -0700 (PDT)
Date: Tue, 30 Jun 2026 15:13:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: adi25charis@gmail.com
Message-ID: <akOy6ORYkzHxodYU@stanley.mountain>
References: <20260629144941.33818-1-adi25charis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260629144941.33818-1-adi25charis@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UBQ7BO35R3JJLSM2RXNKGRGELPJKO7OR
X-Message-ID-Hash: UBQ7BO35R3JJLSM2RXNKGRGELPJKO7OR
X-Mailman-Approved-At: Tue, 30 Jun 2026 13:47:53 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: split topology get into size and data calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UBQ7BO35R3JJLSM2RXNKGRGELPJKO7OR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:adi25charis@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D7846E5055

On Mon, Jun 29, 2026 at 08:19:41PM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> gb_audio_gb_get_topology() combined three separate responsibilities
> into a single call: querying the topology size, allocating a buffer
> for it, and fetching the topology data into that buffer. This left
> callers with no way to perform any of these steps independently, and
> forced the kzalloc() allocation to live inside the protocol-layer
> driver rather than the caller, as already flagged by a FIXME comment
> at the call site in audio_module.c.
> 
> Split the function into two:
> 
>   gb_audio_gb_get_topology_size() - queries only the topology size
>   gb_audio_gb_get_topology()      - fetches topology data into a
>                                      caller-supplied buffer of a
>                                      given size
> 
> Update the only caller, gb_audio_probe() in audio_module.c, to query
> the size first, allocate the topology buffer itself, then fetch the
> data into it, freeing the buffer via the existing free_topology error
> path on failure.
> 
> This resolves both the "TODO: Split into separate calls" comment
> above the original function in audio_gb.c and the FIXME comment at
> the call site in audio_module.c, both of which are removed as part
> of this change.
> 
> No functional change in behavior for the existing probe path.
> 
> Compile-tested with W=1, sparse (C=2), and checkpatch.pl; all clean
> on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).

Put this sort of meta commentary under the --- cut off line.
Also compile the whole module, not just the modified files.

> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> ---
  ^^^

>  drivers/staging/greybus/audio_codec.h  |  4 +++-
>  drivers/staging/greybus/audio_gb.c     | 33 ++++++++++----------------
>  drivers/staging/greybus/audio_module.c | 21 +++++++++++-----
>  3 files changed, 31 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index f3f7a7ec6..be5a2a86b 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -178,8 +178,10 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
>  void gbaudio_unregister_module(struct gbaudio_module_info *module);
>  
>  /* protocol related */
> +int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> +				  u16 *size);

Please store sizes in size_t.

>  int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology **topology);
> +			     struct gb_audio_topology *topology, u16 size);
>  int gb_audio_gb_get_control(struct gb_connection *connection,
>  			    u8 control_id, u8 index,
>  			    struct gb_audio_ctl_elem_value *value);
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb..e6356643d 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -8,13 +8,10 @@
>  #include <linux/greybus.h>
>  #include "audio_codec.h"
>  
> -/* TODO: Split into separate calls */
> -int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology **topology)
> +int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> +				  u16 *size)
>  {
>  	struct gb_audio_get_topology_size_response size_resp;
> -	struct gb_audio_topology *topo;
> -	u16 size;
>  	int ret;
>  
>  	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> @@ -22,24 +19,20 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
>  	if (ret)
>  		return ret;
>  
> -	size = le16_to_cpu(size_resp.size);
> -	if (size < sizeof(*topo))
> -		return -ENODATA;
> -
> -	topo = kzalloc(size, GFP_KERNEL);
> -	if (!topo)
> -		return -ENOMEM;
> +	*size = le16_to_cpu(size_resp.size);
>  
> -	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
> -				topo, size);
> -	if (ret) {
> -		kfree(topo);
> -		return ret;
> -	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
>  
> -	*topology = topo;
> +int gb_audio_gb_get_topology(struct gb_connection *connection,
> +			     struct gb_audio_topology *topology, u16 size)
> +{
> +	if (size < sizeof(*topology))
> +		return -ENODATA;

This check should be done in gb_audio_probe() before the kzalloc().

>  
> -	return 0;
> +	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
> +				 topology, size);
>  }
>  EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
>  
> diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
> index 12c376c47..1163cf093 100644
> --- a/drivers/staging/greybus/audio_module.c
> +++ b/drivers/staging/greybus/audio_module.c
> @@ -239,6 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  	struct gb_audio_manager_module_descriptor desc;
>  	struct gbaudio_data_connection *dai, *_dai;
>  	int ret, i;
> +	u16 size;
>  	struct gb_audio_topology *topology;
>  
>  	/* There should be at least one Management and one Data cport */
> @@ -304,16 +305,24 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  	}
>  	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;
>  
> -	/*
> -	 * FIXME: malloc for topology happens via audio_gb driver
> -	 * should be done within codec driver itself
> -	 */
> -	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
> +	ret = gb_audio_gb_get_topology_size(gbmodule->mgmt_connection, &size);
>  	if (ret) {
> -		dev_err(dev, "%d:Error while fetching topology\n", ret);
> +		dev_err(dev, "%d:Error while fetching topology size\n", ret);
> +		goto disable_connection;
> +	}
> +
> +	topology = kzalloc(size, GFP_KERNEL);
> +	if (!topology) {
> +		ret = -ENOMEM;
>  		goto disable_connection;
>  	}
>  
> +	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);

It's unfortunate that we don't save the size anywhere.  This code
relies on trusting the firmware for its security.  It would be better
to move away from that.

> +	if (ret) {
> +		dev_err(dev, "%d:Error while fetching topology\n", ret);

This is a weird format for a warning.  Normally it %d would come last.
I see that you copied the other printk from earlier, but don't do that.
Only copy good code, not the weirdo stuff.

regards,
dan carpenter

> +		goto free_topology;
> +	}
> +
>  	/* process topology data */
>  	ret = gbaudio_tplg_parse_data(gbmodule, topology);
>  	if (ret) {
> -- 
> 2.53.0
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

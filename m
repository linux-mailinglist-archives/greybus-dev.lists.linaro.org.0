Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cOKTCokcRGp9ogoAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 21:44:09 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 981086E7A10
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 21:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=YcFoOvAF;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9A11B40C8E
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 19:44:07 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	by lists.linaro.org (Postfix) with ESMTPS id 76CFE4098A
	for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 18:59:44 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-448b0ff4a57so1380614fac.2
        for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 11:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782845984; x=1783450784; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vVDK+7rfTbcz4GcngokUtqAZsOvebPGcWgNYsKQ5g3w=;
        b=YcFoOvAFGsy0G5qnNld4JxF8RHr4xt9qSopqkMf9rCJWm82ivnF6BbgRLngU5vwD/v
         XgJc9UP6/T4bq+KNvF9TnCaWEO3VNWAUsLz8ZPjNE7GZuxLDWUdT7n7avRIpoysU7KQ6
         DJTLe+vf1b76IHQnzxd96lS7k/AIxGc2QEvurf8OiRcFladMeE7OOh3gDCkfuF0PUDyG
         7Ds74jxSXhHslip9iJ92OWYA4gqGksy3XchOBpOXE7oNrm5rD5Kg8fZPIRIEqQd/yF4J
         vbMjlDfuwRr/eM4ruVympyeq+HjPAYwsc4ahlJTHnvif5QGeGJYsGTmU8osoe8+mGbnI
         zIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782845984; x=1783450784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVDK+7rfTbcz4GcngokUtqAZsOvebPGcWgNYsKQ5g3w=;
        b=OwjzL8K/reroe0znNZ1s5E2GxNI7kwwAs6fmIHYhZO383d1zzDt9xzYWMUilWKcwnO
         xbR3n0Lud+7g3GS7/u0vNFvf6IelhDgcOmnBfnlrbisYtiSiFIq7calEDFOt2fPXFrNG
         wIFeX57/fiN+1iW+JXYXmG+cmfdW8BoEvltrbhxXofCZdBujkE7UoULEmsrOvahc2iuz
         379ThmTYuwXuXCqv47SKLc7U5VIyPkX6u5e8rJdlHD/zbK0aFjT1VIwiZfXQtVaNYZnK
         aPWiL4XT9TszMkqPo3W/KBpQ+Dg3+UIt5+a7IF9YpPy7J5wCN09HRCgxPtglyoP74hjr
         coXA==
X-Forwarded-Encrypted: i=1; AFNElJ+3aBGfKeCBRRaLXp4Zq7QcA48J77oYSXQCYhxpViabkMsRha41hWqaj9teFC4L84L8th9npd80hHMONQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywb4/GRtBZMY/9Xxi13nC7R6IBaCWSJYhzumMB+Nj6k8YWSu+LX
	3ZKuTWucLJIiKpbu+J19j7lrZh9h3K/Wd8/AhmMYmXckRSNmhQXwwgy9
X-Gm-Gg: AfdE7cn8oAVMxqcauBb9se084jxhAn/Eam8mx38OijQAw6q83/BLwTc0X5/46wPSHzn
	3uOLMMQv3OClv5fWyKCtdQ0lv3yhb2gvYdoivSXBquNsJN+uu2YQEqdwkc9ZKvX/HvXDqxUrgIZ
	rmnpghPox1GHGCS7kumVdPcE3gttcFfDeXoCmQzc90j2bT8Zqtgdu+J8mSU5KBqo6za3Cl6245v
	3OCTB7kApvUqpRIUo9o0aqc74k/KuFDy3yVZUidnW/Hhu1ABNQpraSuOLt5gamjBHJa/N6Vt8ef
	mfP8/MuZHVMCaJf98iUmnQxgK5rhA0bQ6ElIalei0LWXiqePaobWgMPoumS2gMYe8TO1Ngn8+gK
	BpukE6CJfD9igzSIgsPNZDwOGUuiXJ74AWogFxWxl2aYQpQsjPnv6sHLhOcdRFIpT3Vsat3NXLi
	HyoBKZ
X-Received: by 2002:a05:6871:8b87:b0:44a:f310:407c with SMTP id 586e51a60fabf-44af3106221mr787596fac.15.1782845983676;
        Tue, 30 Jun 2026 11:59:43 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448dbee3b97sm3008034fac.10.2026.06.30.11.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 11:59:42 -0700 (PDT)
Date: Tue, 30 Jun 2026 21:59:36 +0300
From: Dan Carpenter <error27@gmail.com>
To: adi25charis@gmail.com
Message-ID: <akQSGNfanqg7tzJ5@stanley.mountain>
References: <akOy6ORYkzHxodYU@stanley.mountain>
 <20260630164602.37663-1-adi25charis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260630164602.37663-1-adi25charis@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KHXXOWM7VV7JVGJRQNJBTVMRH54GAM4A
X-Message-ID-Hash: KHXXOWM7VV7JVGJRQNJBTVMRH54GAM4A
X-Mailman-Approved-At: Tue, 30 Jun 2026 19:44:03 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: audio: split gb_audio_gb_get_topology()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KHXXOWM7VV7JVGJRQNJBTVMRH54GAM4A/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,checkpatch.pl:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 981086E7A10

On Tue, Jun 30, 2026 at 10:16:02PM +0530, adi25charis@gmail.com wrote:
> From: Aditya Chari S <adi25charis@gmail.com>
> 
> Split gb_audio_gb_get_topology() into two functions:
> gb_audio_gb_get_topology_size() to fetch the topology size, and
> gb_audio_gb_get_topology() to fetch the topology data into a
> caller-provided buffer. This moves buffer allocation out of the
> audio_gb protocol helper and into gb_audio_probe(), where it
> belongs, addressing a long-standing FIXME.
> 
> Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
> ---
> v2:
> - Store size as size_t instead of u16, per Dan Carpenter.
> - Move the size validation (size < sizeof(*topology)) out of
>   gb_audio_gb_get_topology() and into gb_audio_probe(), before
>   the kzalloc(), per Dan Carpenter.
> - Fix dev_err() format strings so %d is no longer printed first;
>   put it at the end of the message instead, per Dan Carpenter.
> 
> Compile-tested with `make M=drivers/staging/greybus modules`.
> All modified files (audio_codec.h, audio_gb.c, audio_module.c)
> compile without errors or warnings. checkpatch.pl --no-tree passes
> clean on all three files.
> ---

This v2 patch is built on top of the v1 patch which we're not
going to apply.  It needs to be folded into the v1 patch instead.

>  drivers/staging/greybus/audio_codec.h  |  4 ++--
>  drivers/staging/greybus/audio_gb.c     |  7 ++-----
>  drivers/staging/greybus/audio_module.c | 12 +++++++++---
>  3 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
> index be5a2a86b..b45cd257d 100644
> --- a/drivers/staging/greybus/audio_codec.h
> +++ b/drivers/staging/greybus/audio_codec.h
> @@ -179,9 +179,9 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);
>  
>  /* protocol related */
>  int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> -				  u16 *size);
> +				  size_t *size);
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology *topology, u16 size);
> +			     struct gb_audio_topology *topology, size_t size);
>  int gb_audio_gb_get_control(struct gb_connection *connection,
>  			    u8 control_id, u8 index,
>  			    struct gb_audio_ctl_elem_value *value);
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index e6356643d..2e6f155d8 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -9,7 +9,7 @@
>  #include "audio_codec.h"
>  
>  int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> -				  u16 *size)
> +				  size_t *size)
>  {
>  	struct gb_audio_get_topology_size_response size_resp;
>  	int ret;
> @@ -26,11 +26,8 @@ int gb_audio_gb_get_topology_size(struct gb_connection *connection,
>  EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
>  
>  int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology *topology, u16 size)
> +			     struct gb_audio_topology *topology, size_t size)
>  {
> -	if (size < sizeof(*topology))
> -		return -ENODATA;
> -
>  	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
>  				 topology, size);
>  }
> diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
> index 1163cf093..806533f03 100644
> --- a/drivers/staging/greybus/audio_module.c
> +++ b/drivers/staging/greybus/audio_module.c
> @@ -239,7 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  	struct gb_audio_manager_module_descriptor desc;
>  	struct gbaudio_data_connection *dai, *_dai;
>  	int ret, i;
> -	u16 size;
> +	size_t size;
>  	struct gb_audio_topology *topology;
>  
>  	/* There should be at least one Management and one Data cport */
> @@ -307,7 +307,13 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  
>  	ret = gb_audio_gb_get_topology_size(gbmodule->mgmt_connection, &size);
>  	if (ret) {
> -		dev_err(dev, "%d:Error while fetching topology size\n", ret);
> +		dev_err(dev, "Error while fetching topology size: %d\n", ret);

Just leave this one as-is.  It's from the original code.  Although
you added the word "size" so I guess that kind of makes changing it
acceptable as well.  The rule is you're allowed to make minor white
space changes to line you're touching.  So I guess either way is fine.

> +		goto disable_connection;
> +	}
> +
> +	if (size < sizeof(*topology)) {
> +		dev_err(dev, "Invalid topology size: %zu\n", size);
> +		ret = -ENODATA;

I would probably have said -EINVAL is more appropriate.

>  		goto disable_connection;
>  	}
>  
> @@ -319,7 +325,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
>  
>  	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
>  	if (ret) {
> -		dev_err(dev, "%d:Error while fetching topology\n", ret);
> +		dev_err(dev, "Error while fetching topology: %d\n", ret);

This change is entirely unrelated so it's not allowed.

regards,
dan carpenter

>  		goto free_topology;
>  	}
>  
> -- 
> 2.53.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

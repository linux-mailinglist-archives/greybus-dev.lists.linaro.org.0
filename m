Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A2B6EA5A3
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Apr 2023 10:16:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 244B73F981
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Apr 2023 08:16:04 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	by lists.linaro.org (Postfix) with ESMTPS id F3B963EE47
	for <greybus-dev@lists.linaro.org>; Fri, 21 Apr 2023 08:15:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=HS27dZTQ;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.54 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7637c5ed865so168824339f.3
        for <greybus-dev@lists.linaro.org>; Fri, 21 Apr 2023 01:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1682064958; x=1684656958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCGHRBc+uVHcj0EdY6TeoG6GbZWnSmTkOlbKkZxZR9A=;
        b=HS27dZTQ/xyvfSneaQekhHkzapypxPOR9xdvahvYgvDQdNwCgmyh+hWm94qg9PDiFJ
         JfysofErBDhQA/HBN1RIPTDUgoNCQPmy28GJT0JfJwXpWVPiEFaEa1eGYpDssxjnPKad
         ND4Do1kKYY1hw4bP72aMorvjUlRYIp89179/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682064958; x=1684656958;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCGHRBc+uVHcj0EdY6TeoG6GbZWnSmTkOlbKkZxZR9A=;
        b=C9SfR2ns/pRmaWE1Cc1XCq8nLYkRNCOITjzIGHp63ZPFoyuyiwsPa2rv/yTgAjTcKP
         2TUyNCWVbyaZ2Z9OqI5oCo3x7EbcOGF3iQwj8QAeA5eCoM+tXyDCx0S7AMopVKNi9Qp7
         nohYy3wlMyR5qLEkJSBwql1xFLB78u7gYtOmkRIFVHhbgIiUbiR6F+t4gE9MHfO6MehI
         fNC+vljsB9E9ebsu2kbvxAM1gYEbiUTOfm0TquH1PQZCDiUzaQ1B3M+7sALfNgFJMd8o
         dFeJ1Yvgv2slFY8oPGxS4C5u/jN6jyIeknXnKHFN+N7QMGDVfcnbufQ+KC1J1BWm6aug
         Rjww==
X-Gm-Message-State: AAQBX9dD5hKPJoVl3GRmyctTITXZ18OckLKDfMlNRkgByU2s3MyDvRiX
	LyCLWVYov+EEz3yIb5c946NGAw==
X-Google-Smtp-Source: AKy350a/Ot5qjHO2A6etlksx60Ur9+OLDkpJY5TIXGN6F+YYh4pskZCRYr2Iu4Swk0XPJRox724XXw==
X-Received: by 2002:a5e:9401:0:b0:763:8eea:5d8b with SMTP id q1-20020a5e9401000000b007638eea5d8bmr3006483ioj.4.1682064958394;
        Fri, 21 Apr 2023 01:15:58 -0700 (PDT)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id e22-20020a5d9256000000b0076356c2d1acsm905845iol.52.2023.04.21.01.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 01:15:57 -0700 (PDT)
Message-ID: <57f311ec-381a-e468-3b28-bd73521d5e00@ieee.org>
Date: Fri, 21 Apr 2023 03:15:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, jiangshanlai@gmail.com
References: <20230421025046.4008499-1-tj@kernel.org>
 <20230421025046.4008499-3-tj@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230421025046.4008499-3-tj@kernel.org>
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	BLOCKLISTDE_FAIL(0.00)[98.61.227.136:server fail,209.85.166.54:server fail];
	DKIM_TRACE(0.00)[ieee.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.54:from]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F3B963EE47
X-Spamd-Bar: --------
Message-ID-Hash: 3LN2WEW7U6D2VM4AELVODAKHNQO7MXRY
X-Message-ID-Hash: 3LN2WEW7U6D2VM4AELVODAKHNQO7MXRY
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-team@meta.com, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 02/22] greybus: Use alloc_ordered_workqueue() to create ordered workqueues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3LN2WEW7U6D2VM4AELVODAKHNQO7MXRY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/20/23 9:50 PM, Tejun Heo wrote:
> BACKGROUND
> ==========
> 
> When multiple work items are queued to a workqueue, their execution order
> doesn't match the queueing order. They may get executed in any order and
> simultaneously. When fully serialized execution - one by one in the queueing
> order - is needed, an ordered workqueue should be used which can be created
> with alloc_ordered_workqueue().
> 
> However, alloc_ordered_workqueue() was a later addition. Before it, an
> ordered workqueue could be obtained by creating an UNBOUND workqueue with
> @max_active==1. This originally was an implementation side-effect which was
> broken by 4c16bd327c74 ("workqueue: restore WQ_UNBOUND/max_active==1 to be
> ordered"). Because there were users that depended on the ordered execution,
> 5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active==1 to be ordered")
> made workqueue allocation path to implicitly promote UNBOUND workqueues w/
> @max_active==1 to ordered workqueues.
> 
> While this has worked okay, overloading the UNBOUND allocation interface
> this way creates other issues. It's difficult to tell whether a given
> workqueue actually needs to be ordered and users that legitimately want a
> min concurrency level wq unexpectedly gets an ordered one instead. With
> planned UNBOUND workqueue updates to improve execution locality and more
> prevalence of chiplet designs which can benefit from such improvements, this
> isn't a state we wanna be in forever.
> 
> This patch series audits all callsites that create an UNBOUND workqueue w/
> @max_active==1 and converts them to alloc_ordered_workqueue() as necessary.
> 
> WHAT TO LOOK FOR
> ================
> 
> The conversions are from
> 
>    alloc_workqueue(WQ_UNBOUND | flags, 1, args..)
> 
> to
> 
>    alloc_ordered_workqueue(flags, args...)
> 
> which don't cause any functional changes. If you know that fully ordered
> execution is not ncessary, please let me know. I'll drop the conversion and
> instead add a comment noting the fact to reduce confusion while conversion
> is in progress.
> 
> If you aren't fully sure, it's completely fine to let the conversion
> through. The behavior will stay exactly the same and we can always
> reconsider later.
> 
> As there are follow-up workqueue core changes, I'd really appreciate if the
> patch can be routed through the workqueue tree w/ your acks. Thanks.

Both of the workqueues affected here should be ordered.

Acked-by: Alex Elder <elder@linaro.org>

> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: greybus-dev@lists.linaro.org
> ---
>   drivers/greybus/connection.c | 4 ++--
>   drivers/greybus/svc.c        | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/greybus/connection.c b/drivers/greybus/connection.c
> index e3799a53a193..9c88861986c8 100644
> --- a/drivers/greybus/connection.c
> +++ b/drivers/greybus/connection.c
> @@ -187,8 +187,8 @@ _gb_connection_create(struct gb_host_device *hd, int hd_cport_id,
>   	spin_lock_init(&connection->lock);
>   	INIT_LIST_HEAD(&connection->operations);
>   
> -	connection->wq = alloc_workqueue("%s:%d", WQ_UNBOUND, 1,
> -					 dev_name(&hd->dev), hd_cport_id);
> +	connection->wq = alloc_ordered_workqueue("%s:%d", 0, dev_name(&hd->dev),
> +						 hd_cport_id);
>   	if (!connection->wq) {
>   		ret = -ENOMEM;
>   		goto err_free_connection;
> diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
> index 16cced80867a..0d7e749174a4 100644
> --- a/drivers/greybus/svc.c
> +++ b/drivers/greybus/svc.c
> @@ -1318,7 +1318,7 @@ struct gb_svc *gb_svc_create(struct gb_host_device *hd)
>   	if (!svc)
>   		return NULL;
>   
> -	svc->wq = alloc_workqueue("%s:svc", WQ_UNBOUND, 1, dev_name(&hd->dev));
> +	svc->wq = alloc_ordered_workqueue("%s:svc", 0, dev_name(&hd->dev));
>   	if (!svc->wq) {
>   		kfree(svc);
>   		return NULL;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

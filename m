Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDidFFPGt2kRVQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 09:58:59 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E28F3296900
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 09:58:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D5B453F70C
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Mar 2026 08:58:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	by lists.linaro.org (Postfix) with ESMTPS id 0104B3F683
	for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 08:58:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=hQ5dUE4R;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.47 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso37913135e9.3
        for <greybus-dev@lists.linaro.org>; Mon, 16 Mar 2026 01:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773651534; x=1774256334; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QBu0+9wxUCwZKF4FY2ZZBfYgZz2RjayUk/bVzSL+weA=;
        b=hQ5dUE4RgVXKreSGM4kvngSzwnwLifiqCIWMAkdM7lP88S5XwuC50vHmAfJOFyeoS1
         qxQ9KaGixQu0i8NFQcndHRl7itgHkNBIQ+JNiFsUTZ1Awg/vBlOq9QjAdZNhrH87OUPl
         6tukYQPko9PFj3qtMz6Mt0/zMvBb5daL3pdrBDAiP4ZkefM9Oi12NqAIv90QkA16/Xbk
         JTKbCh3XuhW8CMbd/GBCZq6vncp0tB0OMxI2tQKbBX3SgL9icmBT99pHhaGqNf4MAXGa
         0IGEWLxOX+69BxOCn4hXKMzkBfgOIV+3JBYSZII4JlIP21fGBFAWzmhirVBFUGIjNjH1
         JV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651534; x=1774256334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBu0+9wxUCwZKF4FY2ZZBfYgZz2RjayUk/bVzSL+weA=;
        b=ScUGH5G876cx0ZTX82ei9WbTITQ5iIWiXYgtmycifi7iVnWyLX68fEPrhIobZZ3ARu
         7xaJQD61DwTd1oi0qMaXk3oCvojJ4O1h/z3p8Gl6M7E9/Q54QDwv7G/4l7wOUqAkIpXL
         HMn+cZfdmHtR/6G61brLRiLFg9Y2jAbiwVwgW6CT+oMi77vILUJ9RIa8qa05nrOlNKQp
         ZZM1m7NXUF7fLustXe0el4se/UZsE1DICGsTHmy3BTRKapogtgHm3jGFtIG0v0qz+ixs
         AGReXXL/hXdIufqXZLR4lubRmFgPYvy8nX9QaJP1VZWZFmcFtzs8YnmIlYVwPev0ggJS
         KaLw==
X-Forwarded-Encrypted: i=1; AJvYcCVGjfvy9YqVx1Hk1CQJ/Zg0LDN4A3JURa4Eg1dIOkUPPCqAt9Yo2KUCw8UTNfo6IbVBONOL/3xlG4aIRA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwSp+bqVbx4dhZzsQq8bLC3Tv7Etkfxy4dMppTNZx9M0GbALx/P
	N++eAvuLrz/uMvStPazTIObNu5dNj/cVYINIjYVCZAYQd0GeGDItramBXuK04/hwAZs3Xw==
X-Gm-Gg: ATEYQzyd+z0VS1DIv1/1MaBlDei/A7gRovBXRGcDaLlChnbgH8jOuIhdHKePAt8aWt4
	+Am08GAiZtkmAMJy77MmzyWKFZ1B7lPGdsPwbve6NtuEwvSkxU6OFuloBeVOk3HGZAQV6Fhh6We
	J2CL31DsK6MJCRV2gMhSBHYddvtsbujc0Bc7eLBUdsmtzAZVf081ssqB0OnY2P0nIwsuEos1zuU
	zZhnJRnbEX7vjKfMupIfhBaCK9mv9E9PGYFfXa7KC3aegcsyPO71ed5mhsqthgbBCzPzSsJHLIv
	+VPKUslJUnQqioFM75DNeItiEO7SsYC5a3hUShzoDUHVIm3JjJr80fl8povz4ctyCRqVH7eAO1E
	FeBpLM/IFVmSIw6iwyDFuCsOGpGd1ZQtV8QfiHAKqoEVW2NbcHHW0BET7NVfRcT810EOXzRKCAp
	Y9yWchKKLQBsCwh8/4VGUupctLAxB6
X-Received: by 2002:a05:600c:4592:b0:485:3dfc:57a with SMTP id 5b1f17b1804b1-4855671044fmr204098785e9.32.1773651533830;
        Mon, 16 Mar 2026 01:58:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1affe9sm42587929f8f.15.2026.03.16.01.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:58:53 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:58:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Oarora Etimis <oaroraetimis@gmail.com>
Message-ID: <abfGStu_eSV0xcM6@stanley.mountain>
References: <20260315182028.133028-1-OaroraEtimis@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260315182028.133028-1-OaroraEtimis@gmail.com>
X-Spamd-Bar: ----
Message-ID-Hash: VV5CGC4B44F77AG4XI5XEPZDFMI2E26S
X-Message-ID-Hash: VV5CGC4B44F77AG4XI5XEPZDFMI2E26S
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: bootrom: fix potential null pointer dereference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VV5CGC4B44F77AG4XI5XEPZDFMI2E26S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.177];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[linaro.org:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: E28F3296900
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 02:20:28AM +0800, Oarora Etimis wrote:
> In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
> function jumps to the 'unlock' label. The execution flow continues
> into the 'queue_work' block where 'fw->size' is accessed, leading to
> a null pointer dereference.
> 
> Fix this by adding a NULL check for 'fw' before accessing its members.
> 
> Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
> ---
>  drivers/staging/greybus/bootrom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c322..50c80475d241 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
>  
>  queue_work:
>  	/* Refresh timeout */
> -	if (!ret && (offset + size == fw->size))
> +	if (!ret && fw && (offset + size == fw->size))

Was this a static checker false positive?  Which checker are you using?

If fw is NULL then "ret" is a negative error code so the original code
is fine.

regards,
dan carpenter

>  		next_request = NEXT_REQ_READY_TO_BOOT;
>  	else
>  		next_request = NEXT_REQ_GET_FIRMWARE;
> -- 
> 2.47.3
> 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

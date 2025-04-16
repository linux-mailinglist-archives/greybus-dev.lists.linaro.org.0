Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BCEA90490
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 15:43:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BE5D444AB8
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Apr 2025 13:43:13 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	by lists.linaro.org (Postfix) with ESMTPS id 9920143FCE
	for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 13:43:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="ieMFqq/1";
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.174 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af52a624283so665260a12.0
        for <greybus-dev@lists.linaro.org>; Wed, 16 Apr 2025 06:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744810987; x=1745415787; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FMmsTxqI6R4LS4OuXpWt6I4p2kOrGqbZN4wMpdyEGk=;
        b=ieMFqq/1yDpjJvdldzJUBY6w7FdDZYN74lFQ2TkSfbxCMpuVwe+3IiUBgfTRWQ3r0y
         TVzO032QbIu4aldGnvonVTFpP+r5EK6V5ZAm/5373xO+4c8jWazXjnmfXnU+Ozjytz/6
         cFOYXlkvV7Q85JNqErZcLzkxrohorbUXix1IRTv73MCBtrc2o7cAlMj87NBs29jN/9D+
         4kel6swNgD003ljQaXECC9uoLw8lexhZhs9yBMxDP7cAF58TcVRaW6goqaqGQo2rpkqA
         tUzH7Cf2N9t1PFEDABf6nch+F3DOzZWTS42UePaonxvQ4VOZW8yXErDpdxq5TcO/0u4M
         QDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810987; x=1745415787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FMmsTxqI6R4LS4OuXpWt6I4p2kOrGqbZN4wMpdyEGk=;
        b=vxvKfpglpRdUDObqJ927Rp9SKsJ5pdUrhRpFxwfwcAHop/RlW8B8esJBOL88tJjY7p
         DvmAY4tuPCd/3Tz7eYjPyi+2HzELuOC6tqsqhP2nEMyBk1VOQ7UJQR0+Tk0EFNb0RqT5
         kbPmuuJf1PPhhcIpySkDEx1gR5F6vEwm/gYxL62JbY8Rcjw+s4yJnRsrke5olhux/0Hm
         zPkH2io4Vy4E/ICloLbiKwBQnqGLAsqJhNR6Ew5s5LDmSng+JwEzZ5xFkZrLim5aqtf1
         j6ywzZjcgwQ+GWliv/7fpaYSMxqabkWzA8DdReoyCRO1Hq4WqIfAQLbSxutRYsDzZXYw
         +Mbw==
X-Forwarded-Encrypted: i=1; AJvYcCXzdfreMJsnvJK0Vuq0pgm+vYBiXEaqOX2MMOs5E9bvjIBvC/CW27pfSa3HstgdDNCIxuTjbsOqfNgSDw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx5iGNJT8jmmLIXWzUuUchJ2w/BkwQ2t74aTsDjkk9jh1MaOvZU
	jOXoBOb+1E3Y5X0N9GWX1KSFUaJ92koBAWEw4qFF+BXxl8AYWdj6
X-Gm-Gg: ASbGncswzSh6MoZKrfl9/J9FHpWXZaQ68LcPH5yHlUNNIUO2d96PgmYSa0JmdYBOGCG
	C3pdLKR6arhiAhBGx5SMeGOP14kBa3A1BsDntBPnq1tHYH1VxclVZT2brD4uTHDMUloOSyUQBzL
	NVZh4ImQB06dSOmkSjtb4Uz1aoKkhY59elgy2+TZoh7fejGSckRoV9sA4O1WuWhG/DzgMoVoVRn
	aHH/g9m6T/QxxfVX9GEbHivehFyUq+xrY+qUe5AvL5M/sc+j0fc1NDhHO0kazbcATXJsXf2PNHz
	C5dEGanIq2DJ2/j9iIxSLf4cma7q3XiwjLsuz5oY2E/TzHATuEWI/Vpz+9z3Tg==
X-Google-Smtp-Source: AGHT+IGAF57xlY7daKKfqRRtAHwkl8kenWBXpKkqn7XNIBPG/hMwAVINPlWTUm60iHdirp3RHncuuQ==
X-Received: by 2002:a17:90b:520d:b0:2ff:4a8d:74f9 with SMTP id 98e67ed59e1d1-308642a329amr2862011a91.10.1744810986689;
        Wed, 16 Apr 2025 06:43:06 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b370esm1720823a91.34.2025.04.16.06.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:43:06 -0700 (PDT)
Message-ID: <490ab216-982e-4707-abe4-a5b8d0444458@gmail.com>
Date: Wed, 16 Apr 2025 19:13:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rujra <braker.noob.kernel@gmail.com>, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 outreachy@lists.linux.dev
References: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
X-Rspamd-Queue-Id: 9920143FCE
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_7(0.50)[209.85.215.174:from];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.174:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[mail-pg1-f174.google.com:helo,mail-pg1-f174.google.com:rdns];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: VKVX4TOYAZYI55M3NHB52ITUPP6S7YRG
X-Message-ID-Hash: VKVX4TOYAZYI55M3NHB52ITUPP6S7YRG
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the checks as first-patch
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VKVX4TOYAZYI55M3NHB52ITUPP6S7YRG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/16/25 17:47, rujra wrote:

> added comments on spinlocks for producer-consumer model, rearranged the
> lines on function calls where it should not end with "(" this bracket,
> also removed white-spaces and aligned the arguments of function calls.

Are these manual adjustments, or using clang-format?

I do not care about formatting being "readable". As long as it can be 
done by a tool like clang-format, that's fine with me.

Of course if you are fixing some checkpatch error, that is okay, but if 
now, please avoid formatting changes.

The comments are fine. Although you probably want to add a space between 
`//` and the sentence start.


>
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
>
>> 8------------------------------------------------------8<
>   drivers/greybus/gb-beagleplay.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
> index 473ac3f2d382..fa1c3a40dd0b 100644
> --- a/drivers/greybus/gb-beagleplay.c
> +++ b/drivers/greybus/gb-beagleplay.c
> @@ -73,7 +73,9 @@ struct gb_beagleplay {
>          struct gb_host_device *gb_hd;
>
>          struct work_struct tx_work;
> +       //used to ensure that only one producer can access the shared
> resource at a time.
>          spinlock_t tx_producer_lock;
> +       //used to ensure that only one consumer can access the shared
> resource at a time.
>          spinlock_t tx_consumer_lock;
>          struct circ_buf tx_circ_buf;
>          u16 tx_crc;
> @@ -642,8 +644,8 @@ static int cc1352_bootloader_wait_for_ack(struct
> gb_beagleplay *bg)
>   {
>          int ret;
>
> -       ret = wait_for_completion_timeout(
> -               &bg->fwl_ack_com, msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> +       ret = wait_for_completion_timeout(&bg->fwl_ack_com,
> +
> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>          if (ret < 0)
>                  return dev_err_probe(&bg->sd->dev, ret,
>                                       "Failed to acquire ack semaphore");
> @@ -680,9 +682,8 @@ static int cc1352_bootloader_get_status(struct
> gb_beagleplay *bg)
>          if (ret < 0)
>                  return ret;
>
> -       ret = wait_for_completion_timeout(
> -               &bg->fwl_cmd_response_com,
> -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
> +
> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>          if (ret < 0)
>                  return dev_err_probe(&bg->sd->dev, ret,
>                                       "Failed to acquire last status semaphore");
> @@ -765,9 +766,8 @@ static int cc1352_bootloader_crc32(struct
> gb_beagleplay *bg, u32 *crc32)
>          if (ret < 0)
>                  return ret;
>
> -       ret = wait_for_completion_timeout(
> -               &bg->fwl_cmd_response_com,
> -               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
> +       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
> +
> msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
>          if (ret < 0)
>                  return dev_err_probe(&bg->sd->dev, ret,
>                                       "Failed to acquire last status semaphore");
> --
> 2.43.0


Best Regards,

Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E227DC630
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Oct 2023 07:01:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC6A9402C5
	for <lists+greybus-dev@lfdr.de>; Tue, 31 Oct 2023 06:01:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id F299F3F52E
	for <greybus-dev@lists.linaro.org>; Tue, 31 Oct 2023 06:01:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=kZjDYBlL;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.171 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc58219376so12680065ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 30 Oct 2023 23:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698732096; x=1699336896; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/S8bL/PW+OULKVk4TUEtn6xyrgMH3q6hQoGIN5H6Rug=;
        b=kZjDYBlLYwnPoYUJ51hRijEs3TJ8bT3Nm4IXb4cP+3hFCbqUcvdIC99YPlidoxqAo5
         srV3gWm4LZOzWGfu6lbHF4WdzwZlgihg07y7bapStKFG7VXFvWV4peIsjLeA19M/77LA
         HMiyG0zAKcq/XwLcCeDrL8WfI/fiqrc9jvXoiPsqZMOWqI+qfCDEj6sppaw2ajDbRrXc
         RUnZbH13avSfcu4nrEIhe87dwbS1TawpQkuQiCUtCIUaM7f965MAleM7cyS+wHu7Ke14
         8Oytx8t2tW25vwoV2PknFrEDfyKYBb4xO1BE2AVz+7QWFeUECdQfYutgx2AC3qiJ6YOn
         pzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698732096; x=1699336896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/S8bL/PW+OULKVk4TUEtn6xyrgMH3q6hQoGIN5H6Rug=;
        b=wix9UoiGKHnEueYqA2Q6DRoEbrTYTA3E3uyY7imdcQSlhsV/OwPDGN7PsbqvCEgfal
         yttr1bd58FWQIcW4OV8nxZHtk4gGDd2bqnVWjLbEZWuhqulfIvGTwm99gfZSRl96RwWV
         O7qQ6FJoFVuWvfq0OQTeicOEJ/jl17mPCbHfsNdEyVAoOh1pXcyR6o++M1K/OtYA43qd
         jHwJkGLF6Gl4KI7J9obEqhsZlfyamM8eeZMvlHfJCZB4lGA5/bSyGFlCvg2Mm/ppYJ+e
         UCLG3avgaMiiyluVYkjNWqziKzNbvyAeuXJufESxSjQ5gFwIwzGqbhYS2mkr8ptNe5gO
         wGYQ==
X-Gm-Message-State: AOJu0Yyb2gTWwtUAhAlKKVEJmgoWReFI31Z5DvuqZFWXZ69ccJJBXY+D
	l/4FSbg5RaoIOWgNK1gHC9w=
X-Google-Smtp-Source: AGHT+IHolX+jISwQUN4bORpacho7ZCaCpMy5yAIhXDyOw03NSeOivnnNb5tXnC9lBCXqBO6fIlbF+w==
X-Received: by 2002:a17:903:20d4:b0:1cc:2dad:7ae9 with SMTP id i20-20020a17090320d400b001cc2dad7ae9mr9049442plb.32.1698732095979;
        Mon, 30 Oct 2023 23:01:35 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id j1-20020a170902da8100b001cc307bcdbdsm464552plx.211.2023.10.30.23.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 23:01:35 -0700 (PDT)
Message-ID: <cb2f4d8e-727f-4f07-82c7-52071ffd7135@gmail.com>
Date: Tue, 31 Oct 2023 11:31:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20231031040909.21201-1-rdunlap@infradead.org>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <20231031040909.21201-1-rdunlap@infradead.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F299F3F52E
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.99 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: OV4ZAY2UGYF6MWBIQDCGVNH6S6KWHWLF
X-Message-ID-Hash: OV4ZAY2UGYF6MWBIQDCGVNH6S6KWHWLF
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: BeaglePlay driver needs CRC_CCITT
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OV4ZAY2UGYF6MWBIQDCGVNH6S6KWHWLF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/31/23 09:39, Randy Dunlap wrote:

> The gb-beagleplay driver uses crc_ccitt(), so it should select
> CRC_CCITT to make sure that the function is available.
>
> Fixes these build errors:
>
> s390-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_append_tx_u8':
> gb-beagleplay.c:(.text+0x2c0): undefined reference to `crc_ccitt'
> s390-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_rx_frame':
> gb-beagleplay.c:(.text+0x6a0): undefined reference to `crc_ccitt'
>
> Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ayush Singh <ayushdevel1325@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> ---
>   drivers/greybus/Kconfig |    1 +
>   1 file changed, 1 insertion(+)
>
> diff -- a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> --- a/drivers/greybus/Kconfig
> +++ b/drivers/greybus/Kconfig
> @@ -20,6 +20,7 @@ if GREYBUS
>   config GREYBUS_BEAGLEPLAY
>   	tristate "Greybus BeaglePlay driver"
>   	depends on SERIAL_DEV_BUS
> +	select CRC_CCITT
>   	help
>   	  Select this option if you have a BeaglePlay where CC1352
>   	  co-processor acts as Greybus SVC.

Thanks.

Reviewed-by: Ayush Singh <ayushdevel1325@gmail.com>


Ayush Singh

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BDC818CC8
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 17:48:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4F4223F321
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Dec 2023 16:48:06 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	by lists.linaro.org (Postfix) with ESMTPS id C0FC43F983
	for <greybus-dev@lists.linaro.org>; Sat, 16 Dec 2023 20:23:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=D1fiOWwo;
	spf=pass (lists.linaro.org: domain of hkallweit1@gmail.com designates 209.85.167.54 as permitted sender) smtp.mailfrom=hkallweit1@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-50dfac6c0beso2202843e87.2
        for <greybus-dev@lists.linaro.org>; Sat, 16 Dec 2023 12:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702758228; x=1703363028; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X78ZMdhhJN3JWpvieTeot9+oGs2JdmyEnHsVumMXT3Q=;
        b=D1fiOWwox7QeEI7+4IY7b3J7R4z7Ooxp7LyyapqQLPkZUROowVPQKTZn5Z0qMw8FP0
         udzosMdkrUAtIia7NSIqygDoWPnnpdoOgjT11NIRdsJOOT5CwMGK/NRwHYaLyvtK6uCY
         EDVZiHXWsnWAo9FCQGLgJMjp2V10lH37dvA5rYWMFmtGopw2yHys0AdlfOO4q3k2TuD6
         QDAIETNl9NlgVCNuq5+5MBU8g/qG8urTbgb2SvT5bR9eycq7XFCXMkhHhx5kd+NUvY+F
         Rr2U8aLmxCd7oOzhM1H9Ew59IQxLwAxe8xq9P1mtpGPyFDbB6P34BqWYrU0tgelV+pv4
         590Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702758228; x=1703363028;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X78ZMdhhJN3JWpvieTeot9+oGs2JdmyEnHsVumMXT3Q=;
        b=Vq7OcP8BK/XyC+ZnfSppQyG3MItfeh49nUTJlIMaEx3/p4Su/t8aYDK7aPDkzfD8xq
         DGcpD4cDdF10zKqwdNlBYqp5I8P8A5vE6Yym5u7bY2VUjvpdufkZTG1svueH6qSzUlBF
         Gyb/uq6h3lhdAwrPau9Wdow3MagbZTHIQj7/dOks5zn1FjQA3AkMgGZLsu1I/11Yb6IA
         Fyn7Q+J8J6hFPSKkz3P5F7thV36u+vaBpmuxyO3Pbc6scBknpocirFH8llAUGxkPfImo
         X7q4dJiMYl6A33QDcBELZLUEaDMqstKUn+g9SnBK55vI5iHcLJHbBtK1aqZVrD9RcnVq
         R3mQ==
X-Gm-Message-State: AOJu0YxtIz9yMGowl04wyeuYhxni3RsW7onE6OXUZKBIo+9sxzQCIslh
	uKqBhzAbSwhoMdf3raQkdJI=
X-Google-Smtp-Source: AGHT+IENVxCq/MWAUwaWFwVw1NBBuQ99lFXbm4n4EZzX7Uw0VXV/iqkibbscxZaDoXeUTqcZsh2O8g==
X-Received: by 2002:a19:6559:0:b0:50b:efd3:7e3c with SMTP id c25-20020a196559000000b0050befd37e3cmr6015036lfj.31.1702758228277;
        Sat, 16 Dec 2023 12:23:48 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcb9:f800:bce0:dd9c:e9fe:4f11? (dynamic-2a01-0c23-bcb9-f800-bce0-dd9c-e9fe-4f11.c23.pool.telefonica.de. [2a01:c23:bcb9:f800:bce0:dd9c:e9fe:4f11])
        by smtp.googlemail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm12099727ejc.206.2023.12.16.12.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Dec 2023 12:23:47 -0800 (PST)
Message-ID: <b2dd7159-844e-4d5a-832d-a2e8c0f26f50@gmail.com>
Date: Sat, 16 Dec 2023 21:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>
References: <20231124101619.6470-1-hkallweit1@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20231124101619.6470-1-hkallweit1@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.54:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,csgroup.eu,gmail.com,lists.linaro.org,lists.linux.dev,lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C0FC43F983
X-Spamd-Bar: ---
X-MailFrom: hkallweit1@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6GQ5AYVSKDIGYB7C2UDGGWJXRABBZ6M2
X-Message-ID-Hash: 6GQ5AYVSKDIGYB7C2UDGGWJXRABBZ6M2
X-Mailman-Approved-At: Tue, 19 Dec 2023 16:47:39 +0000
CC: linux-i2c@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/10] Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6GQ5AYVSKDIGYB7C2UDGGWJXRABBZ6M2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:16, Heiner Kallweit wrote:
> After removal of the legacy eeprom driver the only remaining I2C
> client device driver supporting I2C_CLASS_SPD is jc42. Because this
> driver also supports I2C_CLASS_HWMON, adapters don't have to
> declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
> It's one step towards getting rid of I2C_CLASS_SPD mid-term.
> 
> Series was created supported by Coccinelle and its splitpatch.
> 
> v2:
> - fix style issue in patch 4
> - add ack in patch 2
> - set proper subject prefix for all patches
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> ---
> 
>  drivers/i2c/busses/i2c-ali1535.c                  |    2 +-
>  drivers/i2c/busses/i2c-ali1563.c                  |    2 +-
>  drivers/i2c/busses/i2c-ali15x3.c                  |    2 +-
>  drivers/i2c/busses/i2c-amd756.c                   |    2 +-
>  drivers/i2c/busses/i2c-amd8111.c                  |    2 +-
>  drivers/i2c/busses/i2c-elektor.c                  |    2 +-
>  drivers/i2c/busses/i2c-gpio.c                     |    2 +-
>  drivers/i2c/busses/i2c-ibm_iic.c                  |    2 +-
>  drivers/i2c/busses/i2c-iop3xx.c                   |    2 +-
>  drivers/i2c/busses/i2c-isch.c                     |    2 +-
>  drivers/i2c/busses/i2c-kempld.c                   |    3 +--
>  drivers/i2c/busses/i2c-mlxcpld.c                  |    2 +-
>  drivers/i2c/busses/i2c-nforce2.c                  |    2 +-
>  drivers/i2c/busses/i2c-pasemi-pci.c               |    2 +-
>  drivers/i2c/busses/i2c-piix4.c                    |    2 +-
>  drivers/i2c/busses/i2c-scmi.c                     |    2 +-
>  drivers/i2c/busses/i2c-sh7760.c                   |    2 +-
>  drivers/i2c/busses/i2c-sibyte.c                   |    4 ++--
>  drivers/i2c/busses/i2c-sis5595.c                  |    2 +-
>  drivers/i2c/busses/i2c-sis630.c                   |    2 +-
>  drivers/i2c/busses/i2c-sis96x.c                   |    2 +-
>  drivers/i2c/busses/i2c-via.c                      |    2 +-
>  drivers/i2c/busses/i2c-viapro.c                   |    2 +-
>  drivers/i2c/busses/scx200_acb.c                   |    2 +-
>  drivers/i2c/i2c-stub.c                            |    2 +-
>  drivers/media/pci/netup_unidvb/netup_unidvb_i2c.c |    2 +-
>  drivers/staging/greybus/i2c.c                     |    2 +-
>  27 files changed, 28 insertions(+), 29 deletions(-)

This series and my other series are sitting idle in patchwork
for 3 weeks now. AFAICS they have the needed ack's.
Anything missing before they can be applied?

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

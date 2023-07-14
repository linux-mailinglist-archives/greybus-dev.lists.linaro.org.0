Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D9575424C
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 20:10:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A1B1A402C4
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 18:10:52 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	by lists.linaro.org (Postfix) with ESMTPS id 82E903E94B
	for <greybus-dev@lists.linaro.org>; Fri, 14 Jul 2023 18:10:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=Mpdbmrnz;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.41 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-786bb09e595so76451339f.1
        for <greybus-dev@lists.linaro.org>; Fri, 14 Jul 2023 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1689358246; x=1691950246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ElBmMm1ZevyAKtumVID4tVMI+TD8QnK9EnzezYAZC1A=;
        b=Mpdbmrnz6XIJWmlHQJGoTmuC7D53w+ptxGvR1qzM5rcUr2yuAkawf06rjkPYMTBpFq
         l6MjPg1ZjnoCWgc8pvFZw+blKr4qxg2V0sQF1H0WVPdY6+DHII+TihuXYaBMer6Ieai0
         olDYpMIpFkabUds26CFLUeHKHqIZFPDKt93i0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689358246; x=1691950246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElBmMm1ZevyAKtumVID4tVMI+TD8QnK9EnzezYAZC1A=;
        b=D3TYB+hSB1TEh+eSWv+sicS+cwn0Bb5Es7GL5M15+EV1jdsijdOyBwmSVlZpZLCODd
         C1/8Cxx86aYDMT/8lAK46Zu0ETKWBg4MN/WzV1XHuOAfOZkm9ivZ3miCeWyvBLelSu7R
         tKi6jcKss1pH/JscM5HznyxufSV885AHax0Bt1ZYqmrQV+0jqGrjRwN2XQGXracE+EX/
         rz9jlOe9i1BqGyqi1lnQyJwo3LYcFWpNPNUMkiqL2SVusuvPeYfpRUPic4DJLX1dRjoG
         SFoYmekO+VqOlTNPE036BzK1sdjkrRtqTKoKvl79nrEETdixx6AOfpr2CnAco/YgN2h7
         BACg==
X-Gm-Message-State: ABy/qLaHbK+41Gds9uBvJNkCGwhMAyfVPyuzAu7OiYK+sLvOETeA+m4o
	Bd63bmXp2fOgioUw9cqRU9fayA==
X-Google-Smtp-Source: APBJJlGUGWVq3dRmIhivYzT09y1C8kNKMoIaBZuLBrLyn6F4EFbPgbam3zAfvH0LyeRyezDMUEgn+A==
X-Received: by 2002:a05:6e02:221e:b0:346:bf9:76fb with SMTP id j30-20020a056e02221e00b003460bf976fbmr2505344ilf.6.1689358246007;
        Fri, 14 Jul 2023 11:10:46 -0700 (PDT)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id ee14-20020a056638292e00b0042ad6abe0bbsm2820039jab.20.2023.07.14.11.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 11:10:44 -0700 (PDT)
Message-ID: <2af8ba3f-566a-756e-48bf-3e723bc713da@ieee.org>
Date: Fri, 14 Jul 2023 13:10:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>
References: <20230714175002.4064428-1-robh@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230714175002.4064428-1-robh@kernel.org>
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[98.61.227.136:received];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.41:from];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_IN_DNSWL_FAIL(0.00)[209.85.166.41:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,pengutronix.de,nxp.com,linaro.org,baylibre.com,googlemail.com,bootlin.com,csie.org,sholland.org,nvidia.com,microchip.com];
	DKIM_TRACE(0.00)[ieee.org:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 82E903E94B
X-Spamd-Bar: -------
Message-ID-Hash: NT5OSM5TKHZ4KMBARE57NMBETR4HJD3H
X-Message-ID-Hash: NT5OSM5TKHZ4KMBARE57NMBETR4HJD3H
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: Explicitly include correct DT includes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NT5OSM5TKHZ4KMBARE57NMBETR4HJD3H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 7/14/23 12:50 PM, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For drivers/staging/greybus/arche-platform.c:

Acked-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/staging/axis-fifo/axis-fifo.c             | 6 ++----
>   drivers/staging/greybus/arche-platform.c          | 1 +

. . .

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

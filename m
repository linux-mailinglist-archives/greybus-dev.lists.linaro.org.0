Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E69B578EF6A
	for <lists+greybus-dev@lfdr.de>; Thu, 31 Aug 2023 16:16:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D46763EFD2
	for <lists+greybus-dev@lfdr.de>; Thu, 31 Aug 2023 14:16:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by lists.linaro.org (Postfix) with ESMTPS id 7A58B3ECBB
	for <greybus-dev@lists.linaro.org>; Thu, 31 Aug 2023 14:16:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=xG+b+sIK;
	spf=pass (lists.linaro.org: domain of nm@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nm@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37VEGfa8078414;
	Thu, 31 Aug 2023 09:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693491401;
	bh=rwNo16wlQ6/Xp/MN520wn7XJGdxOWfzZDyh1cDSiY50=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=xG+b+sIK2mQIBLizMXC5zbsenbZrJqC5ahmCoiGYfcHVsDrYT2WmTXa535PTlGEXn
	 sXjiRHR7OyW39G07jbVGYnXiXzbJ/LpPxD+FMerTyVuC3gXKYQQcqJVGMeUOUKwzPO
	 JJRtuAKemiLdZeXQQ8iBZGRcu5upXUHezMvw3hR4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37VEGf3P108250
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Aug 2023 09:16:41 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 09:16:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 09:16:40 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37VEGe5x014322;
	Thu, 31 Aug 2023 09:16:40 -0500
Date: Thu, 31 Aug 2023 09:16:40 -0500
From: Nishanth Menon <nm@ti.com>
To: Ayush Singh <ayushdevel1325@gmail.com>
Message-ID: <20230831141640.qbyjh2atri5keerh@seltzer>
References: <20230831140417.327283-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831140417.327283-1-ayushdevel1325@gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Queue-Id: 7A58B3ECBB
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.23.248/30];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[198.47.23.249:from];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:161, ipnet:198.47.23.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[ti.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AA7XUWIHDIH55SPXNOGDXS3VSF55FDS2
X-Message-ID-Hash: AA7XUWIHDIH55SPXNOGDXS3VSF55FDS2
X-MailFrom: nm@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 0/2] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AA7XUWIHDIH55SPXNOGDXS3VSF55FDS2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: 7bit

On 19:34-20230831, Ayush Singh wrote:
> This driver can be used in any Greybus setup where SVC and Linux Host
> are connected over UART.
> 
> This driver has been tested on BeaglePlay by BeagleBoard.org. It
> communicates with BeaglePlay CC1352 co-processor which serves as Greybus
> SVC. This replaces the old setup with bcfserial, wpanusb and GBridge. This
> driver also contains async HDLC code since communication with SVC take
> place over UART using HDLC.
> 
> This patchset also introduces a compatible property for the UART that is
> connected to CC1352 in BeaglePlay. I am not quite sure if it needs its
> own DT Schema file under `Documentation/devicetree/bindings/serial`.
> 
> This driver has been created as a part of my Google Summer of Code 2023.
> For more information, take a look at my blog.
> 
> This patchset has been tested over `next-20230825`.
> 
> My GSoC23 Blog: https://programmershideaway.xyz/tags/gsoc23/
> Zephyr App: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware
> GitHub Branch: https://github.com/Ayush1325/linux/tree/gb-beagleplay
> Video Demo: https://youtu.be/GVuIB7i5pjk
> 
> This the v3 of this patch
> v2 -> v3:
> - Move gb-beagleplay out of staging

You missed the comments I provided you offline:
a) The sequence of patches should be:
Device tree binding yaml binding
driver changes
dts update
b) subject line: follow the convention of the files being touched - do git log --oneline file_name to see convention

I am not cced on the patches, so I will repeat what I had commented
previously on gsoc channel:
c) commit message should have more detailed commit message to explain to the reviewer why the change is needed etc..

You also should CC relevant mailing lists including lkml devicetree etc.

> 
> v1 -> v2:
> - Combine the driver into a single file
> - Remove redundant code
> - Fix Checkpatch complaints
> - Other suggested changes
> 
> Ayush Singh (2):
>   dts: Add beaglecc1352 to devicetree
>   greybus: Add BeaglePlay Linux Driver
> 
>  MAINTAINERS                                   |   5 +
>  .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
>  drivers/greybus/Kconfig                       |  10 +
>  drivers/greybus/Makefile                      |   3 +-
>  drivers/greybus/gb-beagleplay.c               | 494 ++++++++++++++++++
>  5 files changed, 515 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/greybus/gb-beagleplay.c
> 
> -- 
> 2.41.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

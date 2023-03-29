Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5C6CF864
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Mar 2023 02:53:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7BA1A3E966
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Mar 2023 00:53:38 +0000 (UTC)
Received: from cstnet.cn (smtp85.cstnet.cn [159.226.251.85])
	by lists.linaro.org (Postfix) with ESMTP id 4877B3EC5F
	for <greybus-dev@lists.linaro.org>; Wed, 29 Mar 2023 07:52:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of sunying@nj.iscas.ac.cn designates 159.226.251.85 as permitted sender) smtp.mailfrom=sunying@nj.iscas.ac.cn;
	dmarc=none
Received: from sunying$nj.iscas.ac.cn ( [204.44.112.13] ) by
 ajax-webmail-APP-13 (Coremail) ; Wed, 29 Mar 2023 15:52:30 +0800
 (GMT+08:00)
X-Originating-IP: [204.44.112.13]
Date: Wed, 29 Mar 2023 15:52:30 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5a2Z5rui?= <sunying@nj.iscas.ac.cn>
To: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20221213(4b1d97a5)
 Copyright (c) 2002-2023 www.mailtech.cn cnic.cn
MIME-Version: 1.0
Message-ID: <bc6c86d.11bb9.1872c5aa2cb.Coremail.sunying@nj.iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: twCowACXn18_7iNkH9QOAA--.38250W
X-CM-SenderInfo: 5vxq5xdqj60y4olvutnvoduhdfq/1tbiCQQFAWQj49YqzwAAse
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4877B3EC5F
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[159.226.251.85:from,204.44.112.13:received];
	R_SPF_ALLOW(-0.20)[+ip4:159.226.251.0/25];
	RCVD_NO_TLS_LAST(0.10)[];
	ONCE_RECEIVED(0.10)[];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:7497, ipnet:159.226.0.0/16, country:CN];
	DMARC_NA(0.00)[iscas.ac.cn];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_SPAM(0.00)[0.978];
	RCVD_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	ARC_NA(0.00)[]
X-MailFrom: sunying@nj.iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7O7SDVP2NDPKOCIYOLIPUOSL7L3RU4WM
X-Message-ID-Hash: 7O7SDVP2NDPKOCIYOLIPUOSL7L3RU4WM
X-Mailman-Approved-At: Thu, 30 Mar 2023 00:53:35 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Multiple undefined configuration options are dependent in Kconfig under the v6.3-rc4 drivers directory
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7O7SDVP2NDPKOCIYOLIPUOSL7L3RU4WM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It has been discovered that the following configuration options are undefined in the current latest version, v6.3-rc4, yet they are being relied upon by other configuration options in multiple Kconfig files:

MIPS_BAIKAL_T1 is undefined, used as a 'depends on' condition in multiple files such as drivers/ata/Kconfig, drivers/hwmon/Kconfig, drivers/bus/Kconfig, and drivers/memory/Kconfig.
MFD_MAX597X is undefined, used as a 'depends on' condition in Kconfig file drivers/regulator/Kconfig.
MFD_SM5703 is undefined, used as a 'depends on' condition in Kconfig file drivers/regulator/Kconfig.
ARCH_THUNDERBAY is undefined, used as a 'depends on' condition in Kconfig files drivers/pinctrl/Kconfig and drivers/phy/intel/Kconfig.
ARCH_BCM4908 is undefined, used as a 'depends on' condition in Kconfig file drivers/leds/blink/Kconfig.
MFD_TN48M_CPLD is undefined, used as a 'depends on' condition in Kconfig files drivers/gpio/Kconfig and drivers/reset/Kconfig. 
USB_HSIC_USB3613 is undefined, used as a 'depends on' condition in drivers/staging/greybus/Kconfig and drivers/staging/greybus/arche-platform.c.

If these 7 configuration options are deprecated, it is recommended to remove the dependencies on them in the Kconfig files. 
If they are still useful, it is recommended to define them.


Best regards,
Ying Sun
Pengpeng Hou
Yanjie Ren
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

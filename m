Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5ABD38CB8
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Jan 2026 06:40:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 21949401BA
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Jan 2026 05:40:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by lists.linaro.org (Postfix) with ESMTPS id 5CDD33F83E
	for <greybus-dev@lists.linaro.org>; Sat, 17 Jan 2026 05:40:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b="Dif9rO3/";
	spf=none (lists.linaro.org: domain of rdunlap@infradead.org has no SPF policy when checking 198.137.202.133) smtp.mailfrom=rdunlap@infradead.org;
	dmarc=pass (policy=none) header.from=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=HgW9C7zIs1FTgkiK/aV9D8CBW+qT2NeQ39NuD35ARV8=; b=Dif9rO3/6r28DnpwpRS7hezSNQ
	fW/hojBbRu7QL4+75qtsYcTaVAGXOnZ/Kq3cpZt3p8PIHGnADQsN2gnjjhrz/Ivm0tF6e4hnESRHn
	icZ+qsdf7/66MspyTeR9GOKcJZCH1Xvskp+MmCmCGtvmGhD+Cu318ZvbMKrbvB0++F5cdjnMiOwWI
	kF1KxXnvYO13hk6QTk98S4JoSwMke1vTwndMh3izZ/4QMJpDUmJ8Z81id4QngW3U8ho009h/rTq3w
	+CRP6l4m+pTZD/afCo2TrgmN4HAYd+u3dBfnjvw2DBsa9NqzOYAlicKM4bi5gEd4zkeOW/dQmfNP3
	emJo1FOw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgz3L-0000000FIqA-49UB;
	Sat, 17 Jan 2026 05:40:52 +0000
Message-ID: <26b4abdb-ab04-4637-a5df-262eed1d9629@infradead.org>
Date: Fri, 16 Jan 2026 21:40:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <aWdgCblk91iJE4T2@hovoldconsulting.com>
 <f51a80c9-bc87-442e-b2e5-0e688a4cedd1@infradead.org>
 <aWoXbQYqVeahIxc8@hovoldconsulting.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aWoXbQYqVeahIxc8@hovoldconsulting.com>
X-Rspamd-Queue-Id: 5CDD33F83E
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:7247, ipnet:198.137.202.0/24, country:US];
	DWL_DNSWL_BLOCKED(0.00)[infradead.org:dkim];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[infradead.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AEODJLCZ5HPKVRZT3Z7L4QXKHWUGYPOA
X-Message-ID-Hash: AEODJLCZ5HPKVRZT3Z7L4QXKHWUGYPOA
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AEODJLCZ5HPKVRZT3Z7L4QXKHWUGYPOA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/16/26 2:48 AM, Johan Hovold wrote:
> On Wed, Jan 14, 2026 at 04:28:33PM -0800, Randy Dunlap wrote:
>> On 1/14/26 1:21 AM, Johan Hovold wrote:
>>> On Mon, Dec 29, 2025 at 10:27:04PM -0800, Randy Dunlap wrote:
>>>> The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
>>>> tree. Drop it since it unused.
>>>>
>>>> Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")
>>>
>>> As the commit message of that commit says this was done on purpose to
>>> allow the driver to be compile tested without the out-of-tree driver
>>> that never went upstream.
>>>
>>> These days we have a USB hub driver that should probably be used
>>> instead, but yeah, someone would need to do the rework.
>>
>> We?
>> Do you mean drivers/usb/core/hub.c?
> 
> I meant the on-board hub driver (now renamed to "on-board dev") which
> did not exist when this greybus driver was written and merged to
> staging:
> 
> 	drivers/usb/misc/onboard_usb_dev_pdevs.c
> 
>>>> -#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
>>>> -#include <linux/usb/usb3613.h>
>>>> -#else
>>>>  static inline int usb3613_hub_mode_ctrl(bool unused)
>>>>  {
>>>>  	return 0;
>>>>  }
>>>> -#endif
>>>>  
>>>>  #define WD_COLDBOOT_PULSE_WIDTH_MS	30
>>>>  
>>>> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
>>>> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
>>>> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>>>>  
>>>>  config GREYBUS_ARCHE
>>>>  	tristate "Greybus Arche Platform driver"
>>>> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>>>>  	help
>>>>  	  Select this option if you have an Arche device.
>>>
>>> The above just seems to hide the fact that the driver currently cannot
>>> be used.
>>>
>>> Can you please at least add some kind of TODO comment to indicate that
>>> the driver should be reworked to drop the dependency on the OOT driver?
>>
>> Sure, I can add that, but I think it needs more info. Reworked how?
>> What should the usb3613_hub_mode_ctrl() function do?
> 
> IIRC, this driver exists since we needed to power on the on-board USB
> hub so that the controller could be enumerated. Since there was no
> support for doing such things at the time in mainline, we have this
> custom interface for calling into the out-of-tree hub driver.
> 
> I'd need to spend more time looking at this to say exactly how this
> should be reworked.
> 
>>> And it's probably best to keep the depends on COMPILE_TEST until that
>>
>> ack
>>
>>> has been resolved. Perhaps also wrap usb3613_hub_mode_ctrl() in
>>>
>>> 	#ifdef CONFIG_COMPILE_TEST
>>> 	...
>>> 	#endif
>>
>> Don't think so. The driver calls usb3613_hub_mod_ctrl() in 4 places,
>> so it needs to be there.
> 
> Not if the driver can only be enabled for compile testing.
> 
> Perhaps replacing USB_HSIC_USB3613 with
> 
> 	depends on BROKEN || COMPILE_TEST
> 
> and adding a comment above the ifdeffed usb3613_hub_mode_ctrl() helper
> would make the state of things more clear.
> 
> Or just keep the dependency on the non-existing hub driver symbol. 

Yeah, it's such a mess that I'll just leave it as is.

Perhaps you or someone who cares about it can do something about it.

-- 
~Randy

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D34BD21DA5
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 01:28:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C9A9401BB
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Jan 2026 00:28:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by lists.linaro.org (Postfix) with ESMTPS id 947353F83E
	for <greybus-dev@lists.linaro.org>; Thu, 15 Jan 2026 00:28:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=V7BQZqck;
	spf=none (lists.linaro.org: domain of rdunlap@infradead.org has no SPF policy when checking 198.137.202.133) smtp.mailfrom=rdunlap@infradead.org;
	dmarc=pass (policy=none) header.from=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=rvLeh12gjYrcWInk9fCzIdWX8OO78EURgr9B7iEH+HA=; b=V7BQZqcklp+KzcB/juLl6UQiNG
	amzJWkQHATjvD98bFZ//z4UPD+lyy0eCqN4A63kz5xYezhQFRvptXjHqViwSnATOG42BRdi+xytH0
	84RkVF37LM/nubUv2SFXNkS3FZCZdCPYKjwNjZlxka8i3zMBcLckUpBhGk9nKMBKLoCiJSGzrpF2+
	E77mMv2iJDnIRYiFMr6NkneGsouGQBU0n+pSoDL4W8j8EgdinauYbn+tEBOoJc5fB0QokC1R/d36/
	TmCieM8fq6QqMC4G+5zpdEpIhAOubMYTuxtiYe93gy+mBCJcwSw9Zp/S87G3zKQFRkm1wq1Bk1n56
	9/QFF+ng==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBE3-0000000BE6d-0rVd;
	Thu, 15 Jan 2026 00:28:37 +0000
Message-ID: <f51a80c9-bc87-442e-b2e5-0e688a4cedd1@infradead.org>
Date: Wed, 14 Jan 2026 16:28:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan@kernel.org>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <aWdgCblk91iJE4T2@hovoldconsulting.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aWdgCblk91iJE4T2@hovoldconsulting.com>
X-Rspamd-Queue-Id: 947353F83E
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	RCVD_DKIM_ARC_DNSWL_MED(-0.50)[];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	RCVD_IN_DNSWL_MED(-0.20)[198.137.202.133:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:7247, ipnet:198.137.202.0/24, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: OJZQTPTLK2LPXJVVA23XDNWNXDUFWNWP
X-Message-ID-Hash: OJZQTPTLK2LPXJVVA23XDNWNXDUFWNWP
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OJZQTPTLK2LPXJVVA23XDNWNXDUFWNWP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

On 1/14/26 1:21 AM, Johan Hovold wrote:
> On Mon, Dec 29, 2025 at 10:27:04PM -0800, Randy Dunlap wrote:
>> The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
>> tree. Drop it since it unused.
>>
>> Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")
> 
> As the commit message of that commit says this was done on purpose to
> allow the driver to be compile tested without the out-of-tree driver
> that never went upstream.
> 
> These days we have a USB hub driver that should probably be used
> instead, but yeah, someone would need to do the rework.

We?
Do you mean drivers/usb/core/hub.c?

> And while referencing the commit is good, I'm not sure a Fixes tag is
> warranted.
> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>  
>> --- linux-next-20251219.orig/drivers/staging/greybus/arche-platform.c
>> +++ linux-next-20251219/drivers/staging/greybus/arche-platform.c
>> @@ -23,14 +23,10 @@
>>  #include <linux/of.h>
>>  #include "arche_platform.h"
>>  
>> -#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
>> -#include <linux/usb/usb3613.h>
>> -#else
>>  static inline int usb3613_hub_mode_ctrl(bool unused)
>>  {
>>  	return 0;
>>  }
>> -#endif
>>  
>>  #define WD_COLDBOOT_PULSE_WIDTH_MS	30
>>  
>> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
>> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
>> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>>  
>>  config GREYBUS_ARCHE
>>  	tristate "Greybus Arche Platform driver"
>> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>>  	help
>>  	  Select this option if you have an Arche device.
> 
> The above just seems to hide the fact that the driver currently cannot
> be used.
> 
> Can you please at least add some kind of TODO comment to indicate that
> the driver should be reworked to drop the dependency on the OOT driver?

Sure, I can add that, but I think it needs more info. Reworked how?
What should the usb3613_hub_mode_ctrl() function do?

> And it's probably best to keep the depends on COMPILE_TEST until that

ack

> has been resolved. Perhaps also wrap usb3613_hub_mode_ctrl() in
> 
> 	#ifdef CONFIG_COMPILE_TEST
> 	...
> 	#endif

Don't think so. The driver calls usb3613_hub_mod_ctrl() in 4 places,
so it needs to be there.

-- 
~Randy

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

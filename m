Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F20EECF60A4
	for <lists+greybus-dev@lfdr.de>; Tue, 06 Jan 2026 00:54:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DB96640154
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 23:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by lists.linaro.org (Postfix) with ESMTPS id CEB943F713
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 23:54:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=qaxmBLUN;
	spf=none (lists.linaro.org: domain of rdunlap@infradead.org has no SPF policy when checking 198.137.202.133) smtp.mailfrom=rdunlap@infradead.org;
	dmarc=pass (policy=none) header.from=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=y+RF3jt39iakpkTx/MszKZgnx5LSGitWRk86zl2as3g=; b=qaxmBLUNGCGDsv5yeFlbFxS7nZ
	7IxsW9xE1x4rpLwrT3WeauSkKa/R6mRy5wpIxAIN90zy1sM6QhcrgBCdkn+gNgPh5sg5avGaT6jP7
	EOq3tlsfNjCHpzRS3iGiLKJfnm4P7AwaJRIeGT5p/lURZPeRmW7Whi9V9V6i38+M86TBwmqUWJe5+
	hY88NodLvqDAsbgvNniwPEFIxKgmTC3JdqXyoCmLQ0H87tqoMw/Fb4XvAhL5Od8WpP8uJwaPXkSQD
	9IPSDsCY7pTPC+eINTo5skztfSdAQGHYuh21kLFv1y7ln4OvJ6ASz7UVopn+ebH6HAw0es9OdaSuq
	pdX+fDHg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcuP0-0000000CFMg-0zzo;
	Mon, 05 Jan 2026 23:54:22 +0000
Message-ID: <745af80f-58df-46a2-8316-f52b0ea6d7ec@infradead.org>
Date: Mon, 5 Jan 2026 15:54:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
 <aVuNzWb3TEj74t2M@stanley.mountain> <aVuPidYUPZxCOdRp@stanley.mountain>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aVuPidYUPZxCOdRp@stanley.mountain>
X-Rspamd-Queue-Id: CEB943F713
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[infradead.org:dkim];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	ONCE_RECEIVED(0.20)[];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[arndb.de:email,infradead.org:dkim,infradead.org:mid,infradead.org:from_smtp,infradead.org:from_mime,analog.com:email];
	DKIM_TRACE(0.00)[infradead.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ZPYOKTIBO2LNGAKYDEFZIV7GFTTRXEZO
X-Message-ID-Hash: ZPYOKTIBO2LNGAKYDEFZIV7GFTTRXEZO
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZPYOKTIBO2LNGAKYDEFZIV7GFTTRXEZO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Dan,

On 1/5/26 2:16 AM, Dan Carpenter wrote:
> On Mon, Jan 05, 2026 at 01:09:17PM +0300, Dan Carpenter wrote:
>> On Tue, Dec 30, 2025 at 10:23:40AM -0800, Randy Dunlap wrote:
>>>
>>>
>>> On 12/29/25 10:27 PM, Randy Dunlap wrote:
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
>>> Perhaps I should have left COMPILE_TEST here, like:
>>>
>>> 	depends on COMPILE_TEST
>>>
>>> ?
>>
>> If we're going to do that, we should just delete it.  It's been
>> impossible to build for eight years.
>>

I saw that. I just wanted some feedback on it first.
I'll send v2.

> 
> I did a `git grep 'depends on COMPILE_TEST'` for other drivers which
> are never used and only found this one which was disabled in 2018.

Looks like it should go away also. Thanks.

> regards,
> dan carpenter
> 
> commit da2827a298f8a2159f31466759cbba2dd4f1b65f
> Author: Arnd Bergmann <arnd@arndb.de>
> Date:   Fri Mar 9 22:45:26 2018 +0100
> 
>     usb: isp1362: remove blackfin arch glue
> 
>     The blackfin architecture is getting removed, and this is the last
>     remaining architecture specific setting, so the various hacks
>     can be removed now.
> 
>     From all I can tell, there are no remaining in-tree users of the
>     driver, but it could be used by out-of-tree platform ports.
>     I've marked the driver as 'depends on COMPILE_TEST', short of
>     removing it outright.
> 
>     It was originally written for some ARM PXA machines using the same
>     chip, but that platform never really worked and the code has been
>     removed a long time ago.
> 
>     Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>     Acked-by: Aaron Wu <aaron.wu@analog.com>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 4fcfb3084b36..b85822f0c874 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -360,6 +360,7 @@ config USB_ISP116X_HCD
>  config USB_ISP1362_HCD
>         tristate "ISP1362 HCD support"
>         depends on HAS_IOMEM
> +       depends on COMPILE_TEST # nothing uses this
>         ---help---
>           Supports the Philips ISP1362 chip as a host controller
> 

-- 
~Randy

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

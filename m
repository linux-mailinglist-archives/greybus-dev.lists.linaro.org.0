Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 60900CF696F
	for <lists+greybus-dev@lfdr.de>; Tue, 06 Jan 2026 04:16:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 32D9940155
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Jan 2026 03:16:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by lists.linaro.org (Postfix) with ESMTPS id 22FBE40149
	for <greybus-dev@lists.linaro.org>; Tue,  6 Jan 2026 03:16:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b="rWTUQrL/";
	spf=none (lists.linaro.org: domain of rdunlap@infradead.org has no SPF policy when checking 198.137.202.133) smtp.mailfrom=rdunlap@infradead.org;
	dmarc=pass (policy=none) header.from=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=nQHim4HCX7xICwy0zYdVOLC7CzxkuSBuzcDgPNB/cFg=; b=rWTUQrL/udoKz69oqQy+Ro5Cxh
	Wg/pHTsC62EBBWl/r9sBNUu7VGE7YdN/LwL41HehfKk6PwhtQwg2Inmq72+qcogDb8x+EQw5vVNoA
	wMnSroUKU/WK9MwT6UFnYMzEnzGmLhwCw+jjSL9E7o25SCh2MqMjdFLtNOpsxhQPK05V61D46noMN
	rrCShZCYWqY0PteDiloT1bc4AHzS58Ww50fWQqRfX/zo+QW4hlyVgcxgc2puEnb/2MfqG8YDAQCUc
	/TgbkoFH+XGh+eypzZPOsrw/MscHr3bXVyjsxHctNpSmqcny7X2St7bl7kTiEMnTS3q6ZXKUOPxku
	Tgd6tSIw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxYW-0000000CN7Y-06xp;
	Tue, 06 Jan 2026 03:16:24 +0000
Message-ID: <d78259ce-8bca-418f-a4f8-87139e8d2177@infradead.org>
Date: Mon, 5 Jan 2026 19:16:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
 <aVuNzWb3TEj74t2M@stanley.mountain>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aVuNzWb3TEj74t2M@stanley.mountain>
X-Rspamd-Queue-Id: 22FBE40149
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.30 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_LOW(-1.00)[infradead.org:dkim];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	RCVD_DKIM_ARC_DNSWL_MED(-0.50)[];
	RCVD_IN_DNSWL_MED(-0.20)[198.137.202.133:from];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:7247, ipnet:198.137.202.0/24, country:US];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: CIQES2LGQNIRUWZZIFNTPLWETI4KOOHV
X-Message-ID-Hash: CIQES2LGQNIRUWZZIFNTPLWETI4KOOHV
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CIQES2LGQNIRUWZZIFNTPLWETI4KOOHV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/5/26 2:09 AM, Dan Carpenter wrote:
> On Tue, Dec 30, 2025 at 10:23:40AM -0800, Randy Dunlap wrote:
>>
>>
>> On 12/29/25 10:27 PM, Randy Dunlap wrote:
>>> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
>>> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
>>> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>>>  
>>>  config GREYBUS_ARCHE
>>>  	tristate "Greybus Arche Platform driver"
>>> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>>>  	help
>>>  	  Select this option if you have an Arche device.

OK, with just the v1 patch here, it does build without errors.
Seems like I should leave this patch as is.


  CC [M]  drivers/staging/greybus/arche-platform.o
  CC [M]  drivers/staging/greybus/arche-apb-ctrl.o
  LD [M]  drivers/staging/greybus/gb-arche.o

>> Perhaps I should have left COMPILE_TEST here, like:
>>
>> 	depends on COMPILE_TEST
>>
>> ?
> 
> If we're going to do that, we should just delete it.  It's been
> impossible to build for eight years.


-- 
~Randy

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

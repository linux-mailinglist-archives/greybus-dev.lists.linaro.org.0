Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF0CF2EA8
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 11:09:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 52D3F4013E
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 10:09:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	by lists.linaro.org (Postfix) with ESMTPS id 8D0C33F836
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 10:09:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="iBBJc/iU";
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.54 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbc305552so10634066f8f.0
        for <greybus-dev@lists.linaro.org>; Mon, 05 Jan 2026 02:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767607760; x=1768212560; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlzeuvMnWpm21LjmYT/5/RVCRr6/oOpHIWXrd20iuz4=;
        b=iBBJc/iUp+9BAGX+H6ORtmNcGQp7OmV5cvCswdeZCxt0rs4Zlnn57qR8s6w46WbX8t
         eT6KJrg3b1M19C1D8NVbiZixIVt/rDhRgsHERsluNp91n07JqA2rLgr9DWGIe/CIsinK
         nEGfF2kXMt4K81BbDn9WKHwPPsjTYmwhV/7rrJhZHmrrOjO5u19PDop2md4TWAq1O3l+
         MSkLqcd875/9/kenXEwl6Lxh6pSZaD5ZHma0XZe2ebw8uVd62WX2IGJ1jp+ZdYXjf3E7
         Gp4T9Vxr/apRLBY5hb20ye7cN3pZVsODLgUbskHXRFeHHwyTTgK2JVP+HSY/RVA/0u1/
         ZTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607760; x=1768212560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IlzeuvMnWpm21LjmYT/5/RVCRr6/oOpHIWXrd20iuz4=;
        b=ol2FS8FX8NMBMDR4HGKwy2UGu8JqFQNwE+2DK/LcpZ8YQ+eJKQSe1kZaE/sGTeExDS
         ezi1tRctsKfXGAJWiBdxRXTBawn9c8J0CABV0KzrYXH4XoWWhmaq844wwmyTGbPJnFML
         vkn8pB5sQQkqHhFWLlb+nKJ2pnR1edQ4GO/pDsCuDBJz7u2DXfOg3xuqlaCA7kqlRuqq
         CXlMF8j8yThlr/oVzO+PdAI/ZUhXoKUR8XT2A8VdSGH14w2qN0dIV2QXgakiUwpZVs5s
         RxfhwAvESPEex2AaBzdj5BcLUcfj2BARVo07xbc/Ivh3S4YaVNPJtYHliIYglFDFVbAw
         5+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWk5YqPegMWlQXNqMSTLVveQxSjuTkEqLTMKzyTftkWkD9M5oxkAG/USSDfCSdvMtmVcOWTxtOU0+6Fag==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyk6Ma1OkJw3J/yJ80yzVlur1wPJVk0FGcEvdOxG/sgnJOIBlrN
	70THLtQy2k7jKYP+7Q6InYY/moG9XigOtJ+4wlAipmDjex7OsEAQ4AWA8fNGrDo0Bw5auw==
X-Gm-Gg: AY/fxX4OaD1WiZQVXtIFRHFU7kv3BpdJFz34icEpkHRxhHOj9V9ji80fQM++cd/3nwN
	O3hIwnykzbBIXHpIs51yO6oulKr4xWRjoxzs96U6x7oTXPgk23CHKb6rRj3xrAKF+lnHSCP2Ppd
	uG9fyfiS414YoIBKINxO6NdRahi0QGr+6tzqm4x6Azox3rgyAgS6EyUYxsg24ee3JshlJI9KyR0
	PDfFufrN7ODfZXlTBOhZiQFwH9JQZXi+KDsmB/v09M/zR+bfJPOu3iMFQSR8CT2xRt9fy+UiVvO
	b8vl04Tos6misGtOoTMQ19uD25FtGEigA8pDIRqcrDK6FtdVnOId/72vAAuqme9hUOxEDfVudov
	P5lV0RGa0rvY1+TZ4sxMldPiPSBPw6Ecq3p71SpwmUXIEk1WDUoNDvdLeV9RPomjv3kVpmYkPhW
	6xFk/L+ZePu8ZQYHMz
X-Google-Smtp-Source: AGHT+IFF6mlDf4rn8+0EUNe/LlrIVzaNSb3DcRNWYLhGl4RcIOvMWinAt4Wkd+BSxs91cxf6lLf6ew==
X-Received: by 2002:a05:6000:402a:b0:430:f41f:bd5d with SMTP id ffacd0b85a97d-4324e708e9amr50906571f8f.55.1767607760494;
        Mon, 05 Jan 2026 02:09:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa0908sm99614680f8f.31.2026.01.05.02.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:09:20 -0800 (PST)
Date: Mon, 5 Jan 2026 13:09:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aVuNzWb3TEj74t2M@stanley.mountain>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
X-Rspamd-Queue-Id: 8D0C33F836
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.54:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,linaro.org:from_smtp,linaro.org:from_mime,mail-wr1-f54.google.com:helo,mail-wr1-f54.google.com:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: CMLDH3NDWT4VAJDGWLJJYVNVHZN64MWF
X-Message-ID-Hash: CMLDH3NDWT4VAJDGWLJJYVNVHZN64MWF
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CMLDH3NDWT4VAJDGWLJJYVNVHZN64MWF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 30, 2025 at 10:23:40AM -0800, Randy Dunlap wrote:
> 
> 
> On 12/29/25 10:27 PM, Randy Dunlap wrote:
> > --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> > +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> > @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
> >  
> >  config GREYBUS_ARCHE
> >  	tristate "Greybus Arche Platform driver"
> > -	depends on USB_HSIC_USB3613 || COMPILE_TEST
> >  	help
> >  	  Select this option if you have an Arche device.
> 
> Perhaps I should have left COMPILE_TEST here, like:
> 
> 	depends on COMPILE_TEST
> 
> ?

If we're going to do that, we should just delete it.  It's been
impossible to build for eight years.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

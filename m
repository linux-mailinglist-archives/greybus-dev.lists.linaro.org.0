Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DB095CEA759
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 19:23:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A097440152
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 18:23:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by lists.linaro.org (Postfix) with ESMTPS id 7C90440148
	for <greybus-dev@lists.linaro.org>; Tue, 30 Dec 2025 18:23:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=nvTAMZvN;
	spf=none (lists.linaro.org: domain of rdunlap@infradead.org has no SPF policy when checking 198.137.202.133) smtp.mailfrom=rdunlap@infradead.org;
	dmarc=pass (policy=none) header.from=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JnY3XN2wfgcZU7+W+qNtOAKo8yxoBI9VfLo1kAlBBYs=; b=nvTAMZvNdEXCUvz0C01DYl9MtH
	iHnYHQZ3BuYkLJi6wsG0S0NeWYpnWK5ywuiAID+Y2Yh3DIwOP8gSBvA80uL6p+is/FQxU9sWW1GSy
	gBSduZKPGd79N03mYkYUJ3VG3XZVPTAMI8slbRzbSOoi9WzNxTeHLnpgr8eXfspCcNW6G4nXatcTg
	iqaKZhvMdSS6YF7MOuBVeAaqLucvv5JFxoivuA1HHFgpoVowWJ4RN2/ZIUbsvW1ZP4s4ZdLD8cNE4
	DxX8mXk+oiZ+jM+VJLYuzDejZ7Xt0QcOlfl6Gxz8rwACui3ZESUWc8PCqhZm0++vPWdN6c9akPVd8
	ezuanZFw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaeNh-00000005B4K-21D1;
	Tue, 30 Dec 2025 18:23:41 +0000
Message-ID: <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
Date: Tue, 30 Dec 2025 10:23:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
References: <20251230062704.3339404-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251230062704.3339404-1-rdunlap@infradead.org>
X-Rspamd-Queue-Id: 7C90440148
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MIME_GOOD(-0.10)[text/plain];
	BLOCKLISTDE_FAIL(0.00)[198.137.202.133:server fail];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: BBDQPJZGKVEU3R7BM44QYNHLAQCEF6TC
X-Message-ID-Hash: BBDQPJZGKVEU3R7BM44QYNHLAQCEF6TC
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BBDQPJZGKVEU3R7BM44QYNHLAQCEF6TC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/29/25 10:27 PM, Randy Dunlap wrote:
> --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
>  
>  config GREYBUS_ARCHE
>  	tristate "Greybus Arche Platform driver"
> -	depends on USB_HSIC_USB3613 || COMPILE_TEST
>  	help
>  	  Select this option if you have an Arche device.

Perhaps I should have left COMPILE_TEST here, like:

	depends on COMPILE_TEST

?
-- 
~Randy

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

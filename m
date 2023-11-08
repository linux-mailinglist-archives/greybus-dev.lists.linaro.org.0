Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5752B7E5AE3
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Nov 2023 17:13:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29E103F329
	for <lists+greybus-dev@lfdr.de>; Wed,  8 Nov 2023 16:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by lists.linaro.org (Postfix) with ESMTPS id 83F0D3F044
	for <greybus-dev@lists.linaro.org>; Wed,  8 Nov 2023 16:13:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=CG6GBx86;
	dmarc=none;
	spf=none (lists.linaro.org: domain of rdunlap@infradead.org has no SPF policy when checking 198.137.202.133) smtp.mailfrom=rdunlap@infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xxFBuI9UgLqm+jZa/QCBq+IBtHSiUW/6zK0A02eXdy0=; b=CG6GBx866ahdE8OH0Kss4OPcsI
	RjxksZaTQATcIh3V7wroCVchAFAQHxVF7eZCnLkZLRT1954LHYFdoTgMYDOTcIU1PfvSKwsmffTXz
	dqYMW+ZwYEWA/G6gzoZVhfEnVdUnZnrtNFDhyMnGbU7OS+j+2e4T273MI/Qkopv9XodEmH6v2QDWz
	dsa1pFn/DhM+mEE3XG7RzNuDHhxpkeqw455Y2oj1fzK46dnGa30Bfc119PrI1GjnILWp/njqXwbw0
	2+ilEyjN2vHm0EvILYU8IsSlzoHUKwpAfVgJNkuM1AZ6oCgbuUl1c/FNrebCxlxj5mKqgIo38TCc5
	S2iT3p1Q==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r0lAp-004Goa-2K;
	Wed, 08 Nov 2023 16:12:59 +0000
Message-ID: <d242c2e8-85a8-43b7-8438-d83f1b90c8b2@infradead.org>
Date: Wed, 8 Nov 2023 08:12:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20231108153429.1072732-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231108153429.1072732-1-arnd@kernel.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 83F0D3F044
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.19 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:7247, ipnet:198.137.202.0/24, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,lists.linaro.org,vger.kernel.org];
	DMARC_NA(0.00)[infradead.org];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: JV6HR7MPLVXMSFOOZVCO2DS7C553A6UA
X-Message-ID-Hash: JV6HR7MPLVXMSFOOZVCO2DS7C553A6UA
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: beagleplay: select CONFIG_CRC_CCITT
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JV6HR7MPLVXMSFOOZVCO2DS7C553A6UA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/8/23 07:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without the CRC_CCITT code, the new greybus driver fails to link:
> 
> aarch64-linux-ld: drivers/greybus/gb-beagleplay.o: in function `hdlc_append_tx_u8':
> gb-beagleplay.c:(.text+0x158): undefined reference to `crc_ccitt'
> aarch64-linux-ld: drivers/greybus/gb-beagleplay.o: in function `gb_tty_receive':
> gb-beagleplay.c:(.text+0x5c4): undefined reference to `crc_ccitt'
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/greybus/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
> index 033d31dbf3b8..ab81ceceb337 100644
> --- a/drivers/greybus/Kconfig
> +++ b/drivers/greybus/Kconfig
> @@ -20,6 +20,7 @@ if GREYBUS
>  config GREYBUS_BEAGLEPLAY
>  	tristate "Greybus BeaglePlay driver"
>  	depends on SERIAL_DEV_BUS
> +	select CRC_CCITT
>  	help
>  	  Select this option if you have a BeaglePlay where CC1352
>  	  co-processor acts as Greybus SVC.

Yes, same as my patch:
https://lore.kernel.org/lkml/20231031040909.21201-1-rdunlap@infradead.org/

I expect that Greg just hasn't gotten around to applying new patches/fixes yet.

-- 
~Randy
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

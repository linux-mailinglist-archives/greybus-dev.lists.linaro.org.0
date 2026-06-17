Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hn+OFGZLMmoVyQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 09:23:18 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F18697254
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 09:23:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linaro.org header.s=google header.b=wYQi76uk;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=pass (policy=none) header.from=linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C77B940A3C
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 07:23:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	by lists.linaro.org (Postfix) with ESMTPS id 1EF4240A54
	for <greybus-dev@lists.linaro.org>; Wed, 17 Jun 2026 07:23:02 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso51854765e9.3
        for <greybus-dev@lists.linaro.org>; Wed, 17 Jun 2026 00:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781680981; x=1782285781; darn=lists.linaro.org;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghmwQhSHkDAwTSRuYuaKDBBMN6CrvQZmZ4OsEVLYBP4=;
        b=wYQi76uknAkc3C9xWJYVX8YdCuph9JTs1PcyzJR/yNLAwONLPwDcVOhghd13yYVU0U
         pe71C9C2SWh8bCrFqgIflAzEv3MlakcbAM0MOUMrFn01jJLMYFgoSP93n1h1/6Ke878A
         kln4ap7ObOF4CbJ6GHv66211mI04j1ixkpU7oSEfHj3zXULOPwSkhQyxjaxl58062tD2
         d0dQsc9N6uh/ShpFiWvAWye/vWpt2Sz2LUM/afuGOpdG69nOziW8FiiG7RhxfCKJJ9Z5
         8LdpCSVdsdqtWFT1GahXJvUtlIMusVSNm3RWNghcYHY6ysGVpkFBup1sfDe1RUdTQzKH
         tkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680981; x=1782285781;
        h=in-reply-to:references:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghmwQhSHkDAwTSRuYuaKDBBMN6CrvQZmZ4OsEVLYBP4=;
        b=TxvGGwfi7lVWLNA+OCKL69RN/M3d5gqXi6iN9M5C7i14K71ofIzGEyv6ryWjKd8wjq
         +ByDvC22YW5f5WDxmJ9ON4aYjb5aeywjiYF2f3NODxMgCbhn7DqIxj/3BU4d3RCfph4A
         ENrehHA9TOJcZuPDBBZB7GovIkAv8KoSgyiNW+bSwb4ohu5z+UjcX+NBSicWYktW0II1
         oZX8RheDrLlXeG2HBEVtHvPpHMhgUNnQ0+Uq3SVai2CZyh7joYC622B2WZ5LDpbj3paG
         k6Dj552/YS6U0fuCWkd0X/YxjMjFIRhOAHSmaI0liyZQIXtM4olXzlbgq1zRi/Fkg3tg
         ex/Q==
X-Gm-Message-State: AOJu0Yz4U+ZMetpMFn1rhnID1KdhehspNgNvbINAodlOUiKiQALWMrLb
	ufvIQVluKBcuXdVlDao1iHvI5se314buiVmMv/seA6wdGrwBsiHC7GiF7J0qOHShYoiefQ==
X-Gm-Gg: Acq92OFBirWArwwa+g3Rr5giwl5SiVrqXozeyXVQOsjt2YZcaSpAFCT3WgL1hxxI7SB
	LQY67LrA8kRmSbTmZVReNELczUJ1NWCgccxyqvki0eQ+mg8Qimw76IVqGkSsvynyCCDx9WoudIL
	hORnev0C3iOsAPYR1+IALForDcARmqTLH9ibBaJ7fsf6MLTV+T7aDVU1peSyoLrtYrNSe9uVp6j
	o8D4x7GjJ6++41vOAkxll6+tH3y9v083TUGzICuVwkBZs38eCDqpO1BYvZ93a6Mp2/j47DSp/AS
	IMR9E5fCif+SX7nKNDsck8hr3M7yjossyudmxffAY0TTd27Wc1EUNULFoqIGtL8XWnM5yJiEV8u
	pzF6MGvRVdRFRTY1R4qsD4ri89CNttBEmbcuxoeiqGf3+IgPaSy5RjJvEEhBomL9VB7eHxul6/1
	G7CTOPN3kZwOAA
X-Received: by 2002:a05:600c:c08b:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-492333aa58cmr32166525e9.11.1781680981087;
        Wed, 17 Jun 2026 00:23:01 -0700 (PDT)
Received: from localhost ([2a01:11:8f11:bb70:dddc:c199:bb35:7cb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a0e9e4sm122794975e9.0.2026.06.17.00.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:23:00 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
X-Google-Original-From: "Rui Miguel Silva" <rui.silva@linaro.com>
Mime-Version: 1.0
Date: Wed, 17 Jun 2026 08:22:59 +0100
Message-Id: <DJB572MYSBEV.137UP2YPA88PI@linaro.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Rui Miguel Silva"
 <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex Elder"
 <elder@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20260615-greybus-power-supply-return-parens-v1-1-dcad9dabfe79.ref@yahoo.pl> <20260615-greybus-power-supply-return-parens-v1-1-dcad9dabfe79@yahoo.pl>
In-Reply-To: <20260615-greybus-power-supply-return-parens-v1-1-dcad9dabfe79@yahoo.pl>
X-Spamd-Bar: ---
Message-ID-Hash: 3HIOAOKZWV4B7ICGQVJ4HDMOGOYJRVRV
X-Message-ID-Hash: 3HIOAOKZWV4B7ICGQVJ4HDMOGOYJRVRV
X-MailFrom: rui.silva@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: power_supply: remove unnecessary parentheses in return
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3HIOAOKZWV4B7ICGQVJ4HDMOGOYJRVRV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.51 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomasz.unger@yahoo.pl,m:rmfrfs@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rui.silva@linaro.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.pl,gmail.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rui.silva@linaro.org,greybus-dev-bounces@lists.linaro.org];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,checkpatch.pl:url,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2F18697254

Hi Tomasz,
Thanks for the patch.

On Mon Jun 15, 2026 at 1:13 PM WEST, Tomasz Unger wrote:

> return is not a function, so the parentheses around the returned
> expressions are not needed. Remove them to follow kernel coding
> style and silence checkpatch.pl RETURN_PARENTHESES warnings.
>
> Verified with checkpatch.pl - no errors or warnings.
> Compiled the power_supply object successfully.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>

LGTM,
Acked-by: Rui Miguel Silva <rui.silva@linaro.org>

Cheers,
    Rui

> ---
>  drivers/staging/greybus/power_supply.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/greybus/power_supply.c b/drivers/staging/greybus/power_supply.c
> index 33b7a63979d6..44bd8a72fa50 100644
> --- a/drivers/staging/greybus/power_supply.c
> +++ b/drivers/staging/greybus/power_supply.c
> @@ -336,7 +336,7 @@ static int is_psy_prop_writeable(struct gb_power_supply *gbpsy,
>  
>  static int is_prop_valint(enum power_supply_property psp)
>  {
> -	return ((psp < POWER_SUPPLY_PROP_MODEL_NAME) ? 1 : 0);
> +	return (psp < POWER_SUPPLY_PROP_MODEL_NAME) ? 1 : 0;
>  }
>  
>  static void next_interval(struct gb_power_supply *gbpsy)
> @@ -423,7 +423,7 @@ static void check_changed(struct gb_power_supply *gbpsy,
>  static int total_props(struct gb_power_supply *gbpsy)
>  {
>  	/* this return the intval plus the strval properties */
> -	return (gbpsy->properties_count + gbpsy->properties_count_str);
> +	return gbpsy->properties_count + gbpsy->properties_count_str;
>  }
>  
>  static void prop_append(struct gb_power_supply *gbpsy,
>
> ---
> base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
> change-id: 20260615-greybus-power-supply-return-parens-b3dd9f4a87c7
>
> Best regards,
> --  
> Tomasz Unger <tomasz.unger@yahoo.pl>



_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 786547B5454
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Oct 2023 15:51:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7DBC140D48
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Oct 2023 13:51:32 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	by lists.linaro.org (Postfix) with ESMTPS id E35673E9FC
	for <greybus-dev@lists.linaro.org>; Mon,  2 Oct 2023 13:51:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=VwPfK+d8;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.218.44 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99c3c8adb27so2354383766b.1
        for <greybus-dev@lists.linaro.org>; Mon, 02 Oct 2023 06:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696254685; x=1696859485; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6x75uujKlzJ+W/bfTzwEmKqMbmIlgOpqe2m1PV3yfQ=;
        b=VwPfK+d8BYwlN+cYVssIyG17p1bqiAvZ13SGcVqhPSwaJgWLUiKYFPLHaqkTxXhnc2
         9X1qkB7+VcKUyQf/hKI81vWXp39KKyPW1KP+sUCuyg3i7hYPpkcIsxCCYkcfm1DbFL8I
         /lR8HoEKFA92igx1UMa/q8flFXDg3rUjIR2PoizsMN9p7usvq8lkp4eKrj8+T+jqZbFs
         ppDAdoSp+ndvBPx2YHHQ5/nLwxMei9e3qVam0/CGLaQr1BtIpRRK1FkntotGq9g5Rgsr
         Ia5/u6ojt6+pLmxi1f/TbNNLaj1P2FXvIDvBcC0VWovs3bROwZqhjMltIr9cTm6D5nzR
         5sWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696254685; x=1696859485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j6x75uujKlzJ+W/bfTzwEmKqMbmIlgOpqe2m1PV3yfQ=;
        b=gQUJ3/EoATB1rNKmRBLr1q4OXxOi3PsKkWnBHXEPdV6u4AkrdC40/+c8qo47j9PqGt
         J33feI61ivFTXkz9yRdixQZ0nUARwwNWNcQmOwomrZVYgQY2wOFJcvHke6lj7rmmThYe
         R1eGmb0SDLG2RwQ4mKTdG10w3XcNiVQsZrfMKhDMlrhrtwG4ZwBdzFhqVEyHKMEmx9ot
         RrHhTJSBJa8HLKbfprcfmW6+WPFNu7uZk/a0Olq5LhQuyiZ5DRN23kzXjGaX0tn7fcnB
         O9kEPfNT1OvMF6GxwoR4Szcbsq+aB3G+jYvIrl15McJi0UbZw9RPMTtPJouFEuOWHffO
         VL4w==
X-Gm-Message-State: AOJu0YxzPcIGKw3V2kb3dRJGZyvHpxN02EumnUBVkC1wqN5nZGgtNTrB
	9lP1cGvJ6pvdgtkkPG+A1+7d444a
X-Google-Smtp-Source: AGHT+IFAjAwD1atyAZ0A8/o+1fJemYcy10FOrb6f5i8p0MQihHFZGOWuA6MKJRrMbXKUyYpewgNE/Q==
X-Received: by 2002:a17:906:108f:b0:9b2:b71f:83af with SMTP id u15-20020a170906108f00b009b2b71f83afmr10525307eju.20.1696254684729;
        Mon, 02 Oct 2023 06:51:24 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b009a193a5acffsm16803638ejk.121.2023.10.02.06.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 06:51:24 -0700 (PDT)
Message-ID: <ab06133b-10ee-4953-82ad-e6a6a2aaef9d@linaro.org>
Date: Mon, 2 Oct 2023 15:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
 <20230924113725.164948-3-ayushdevel1325@gmail.com>
 <6ce74c42-d1d0-d9cb-9d90-68989933d1d4@linaro.org>
 <62f5671d-738b-997c-798f-7e6cc00f7ef9@gmail.com>
 <11888c25-466b-2c28-1265-578736182846@linaro.org>
 <66fbd8d1-8b1a-50b5-c442-23847dc3d42f@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <66fbd8d1-8b1a-50b5-c442-23847dc3d42f@gmail.com>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,mail-archive.com:url];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.218.44:from];
	TAGGED_RCPT(0.00)[dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E35673E9FC
Message-ID-Hash: NYGBRMVT7EVIL3A24KSCIFM3XEJDUNGI
X-Message-ID-Hash: NYGBRMVT7EVIL3A24KSCIFM3XEJDUNGI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NYGBRMVT7EVIL3A24KSCIFM3XEJDUNGI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 01/10/2023 20:13, Ayush Singh wrote:

>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, gb_beagleplay_of_match);
>>>>> +
>>>>> +static struct serdev_device_driver gb_beagleplay_driver = {
>>>>> +	.probe = gb_beagleplay_probe,
>>>>> +	.remove = gb_beagleplay_remove,
>>>>> +	.driver = {
>>>>> +	      .name = "gb_beagleplay",
>>>>> +	      .of_match_table = gb_beagleplay_of_match,
>>>> This is still wrongly aligned. Spaces after tab. Are you sure checkpatch
>>>> does not complain bout it?
>>> Again, it doesn't seem to for me. Am I missing some environment
>>> variables or options? Or maybe something wrong with my editor config
>>> (neovim)?
>> You have spaces after tab, so how can this be properly aligned?
>>
>> Best regards,
>> Krzysztof
>>
> So I just wanted to confirm, but I think spaces after tab are fine for 
> alignment, right? I found this 
> (https://www.mail-archive.com/kernelnewbies@kernelnewbies.org/msg13354.html) 
> message in mailing list stating that it is fine.

Spaces after tab are fine *when needed* for proper alignment. You do not
have proper alignment here, so just drop them. Please open any other
existing driver (although not something old...).

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

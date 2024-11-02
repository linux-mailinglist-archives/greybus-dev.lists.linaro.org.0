Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E37C09B9F00
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Nov 2024 11:44:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C4F5E41474
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Nov 2024 10:44:26 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	by lists.linaro.org (Postfix) with ESMTPS id 338113EBEA
	for <greybus-dev@lists.linaro.org>; Sat,  2 Nov 2024 10:43:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=frG2Xqp+;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.45 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-83ab6cbd8b1so110430339f.1
        for <greybus-dev@lists.linaro.org>; Sat, 02 Nov 2024 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730544220; x=1731149020; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5E+zPbIeW2NpGExKCJwVS0jdkrwjIk/vifgXOVF84OM=;
        b=frG2Xqp+po5WIKEMMq22YxNyPZBKDBOqsx+Kyc1RWvJhyDRP2fnu+0WOMEn03wdSO1
         ufLnEuUe1uzbD0X7RNNbcCrBMgZU44vFyVMuo9e6HzDhao0i/8dhYMfJbGFE+3YkTXop
         JVl8MZPWiH8pYi9Oq/5pKJ0uSF6vQsK0D/0uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730544220; x=1731149020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5E+zPbIeW2NpGExKCJwVS0jdkrwjIk/vifgXOVF84OM=;
        b=KfrdWfehKoI/Pdug66Eqp3LY6eLuAxPMvcaPGlu4zZLDv04LuXlzSMmrSz5ZeTSxm9
         d/UKKCXwTA0dsNViK6Qsw+Xdw/NLz7MZ+O0UQVfEHkO+X6cIoomv/D3qUWog5q5ywyQ/
         1srQrtps6g1CiVXhxkup54G5QPFfyLoE9fJxk4p+vjqWkUv0+QNA5ITqtgjfFbImTeBe
         5FB/aIb40oBcLtXyWtWr4ho2HVL6GJ9Hlz/K9D8KEzclwPcMOXiZCNOtARJ/rTyQjupF
         +lva1YhXBS0UssqUhp/Lf3x83Ysx2/NiAY9Ln+ahuzpMkzyI+5Que7pxbI3kIVd9yC58
         yWwA==
X-Forwarded-Encrypted: i=1; AJvYcCXKlUN8KZIBiq1Uf4F5OeOCOOef47TWMePvthGR1UYzBln0fvINxV74x3A6hQVgSshyPuM/Libff5L7FA==@lists.linaro.org
X-Gm-Message-State: AOJu0YyjZHVh912AeTZlqXC8qHmjlS6lc3FaaTeO1KofnSriLHmOpq2e
	20ssQ7Q9V6349N3iXP2ndLUlsVhPMihs71yIYTwY5WZPbopf9Lsjy1/bXHvd2Q==
X-Google-Smtp-Source: AGHT+IFIRQe2VBYWUfM1dViJ0/6r91ZBIV79oZXOk0wloU6pWapZrMDRHrlB1fFtFHkqUCgQyhXoAQ==
X-Received: by 2002:a05:6e02:1c2a:b0:3a4:e99a:bd41 with SMTP id e9e14a558f8ab-3a6b02be160mr70648375ab.12.1730544220349;
        Sat, 02 Nov 2024 03:43:40 -0700 (PDT)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4de048885absm1114575173.29.2024.11.02.03.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 03:43:39 -0700 (PDT)
Message-ID: <171a7284-100a-4850-989d-63b9f7782db4@ieee.org>
Date: Sat, 2 Nov 2024 05:43:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <aad9d19c20ea0463974b7652ba7f2f8d9fec1186.1730540152.git.christophe.jaillet@wanadoo.fr>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <aad9d19c20ea0463974b7652ba7f2f8d9fec1186.1730540152.git.christophe.jaillet@wanadoo.fr>
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.166.45:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.45:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[wanadoo.fr,kernel.org,linuxfoundation.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 338113EBEA
X-Spamd-Bar: --------
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IKPUA6VLOX2LDEKOBW2OMGYHI3CGOQYX
X-Message-ID-Hash: IKPUA6VLOX2LDEKOBW2OMGYHI3CGOQYX
X-Mailman-Approved-At: Sat, 02 Nov 2024 10:44:23 +0000
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix a typo
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IKPUA6VLOX2LDEKOBW2OMGYHI3CGOQYX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 11/2/24 4:35 AM, Christophe JAILLET wrote:
> s/interfce/interface/
> A 'a' is missing. Add it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/greybus/interface.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
> index d022bfb5e95d..a0f3e9422721 100644
> --- a/drivers/greybus/interface.c
> +++ b/drivers/greybus/interface.c
> @@ -780,7 +780,7 @@ const struct device_type greybus_interface_type = {
>    * The position of interface within the Endo is encoded in "interface_id"
>    * argument.
>    *
> - * Returns a pointer to the new interfce or a null pointer if a
> + * Returns a pointer to the new interface or a null pointer if a
>    * failure occurs due to memory exhaustion.
>    */
>   struct gb_interface *gb_interface_create(struct gb_module *module,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

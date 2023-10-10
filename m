Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721D7BF090
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Oct 2023 04:01:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 50AAF3F935
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Oct 2023 02:01:24 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	by lists.linaro.org (Postfix) with ESMTPS id 4A32E3EFFD
	for <greybus-dev@lists.linaro.org>; Tue, 10 Oct 2023 02:01:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=aSIIEi4a;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.172 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3512fae02ecso20687335ab.2
        for <greybus-dev@lists.linaro.org>; Mon, 09 Oct 2023 19:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1696903275; x=1697508075; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8W5jicDuFfCto5Rz0a13pdOEWWZtFkes7WHBt5JLjo=;
        b=aSIIEi4aQWYpgKQYgCrtQBL2Xz68LwSPQnoHmW+ggtW5RiTbHNvnZGGGp3o1irb+w+
         w4MfvfojCCXf847OYM8rSvwwyTA53xYr3KeexdTRc9CKNiA83vOekvb/3PAk9MhdjOyl
         V+pwDIjdJWcTrauNLQh2H0P3xi4Th8kYigmDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696903276; x=1697508076;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n8W5jicDuFfCto5Rz0a13pdOEWWZtFkes7WHBt5JLjo=;
        b=Qd22k9zRwUJlu88de/WyFMERy6I8+NmdNqaGf5Ad6vaMtEdAbJ2dNn4KyOXxRwK7QR
         f3Cqb+JstYKiF3SacgXHjPkulzN49OKoDi+rFhxazrJBMrfLcI1SOIpBpLK5HQ+n77c/
         c7Dai5ndFugmqWLP9ERTfCsA6V6eZTTHUe7gdD4WkSc5MD0Fk/6DCmth7clIUYGb1aOI
         sVzkE0fzHTcqn4vm+oWU3UPKQF0NMwA3M7upCbH8Yn/DrEORHOVVszhoxcIYuP/SlvTU
         Vy90nr43cba2SZ3qUCQJ5ydAB0dmf/q1Q//B5udph96it7c8J1BwR1dxfWHbhWscXr27
         G06Q==
X-Gm-Message-State: AOJu0YwWXjOvCGepL1emJsR6b8Mkoi3u3whQYMAQoUktrn/SSSlEcN0Y
	6tV0Z2qP5HomK/CtG9M1eux6oA==
X-Google-Smtp-Source: AGHT+IFxEbsxiAkqgad1NR+N5qEc+xJnzBRXuoUOorumGMCjl3dh8xe9qk/x6WqhsQZNVSqcE/TbYw==
X-Received: by 2002:a05:6e02:1d1a:b0:351:b22:af5c with SMTP id i26-20020a056e021d1a00b003510b22af5cmr19923893ila.32.1696903275665;
        Mon, 09 Oct 2023 19:01:15 -0700 (PDT)
Received: from [10.211.55.3] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id l17-20020a922811000000b003513b7613f3sm3247512ilf.3.2023.10.09.19.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 19:01:15 -0700 (PDT)
Message-ID: <42a24a62-8dba-452c-b460-61ee06171d74@ieee.org>
Date: Mon, 9 Oct 2023 21:01:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <ZSR2O6zGyT/VX6ve@work>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <ZSR2O6zGyT/VX6ve@work>
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.99 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.172:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4A32E3EFFD
Message-ID-Hash: Y4SEWTOPABYJNSBXCKBZ4ZOZQ27XLHCV
X-Message-ID-Hash: Y4SEWTOPABYJNSBXCKBZ4ZOZQ27XLHCV
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] staging: greybus: Add __counted_by for struct apr_rx_buf and use struct_size()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y4SEWTOPABYJNSBXCKBZ4ZOZQ27XLHCV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 10/9/23 4:52 PM, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
> 
> This code was found with the help of Coccinelle, and audited and
> fixed manually.

Looks good to me, and I like the use of struct_size().

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/staging/greybus/raw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
> index a00978c8e1d2..b9c6eff7cdc1 100644
> --- a/drivers/staging/greybus/raw.c
> +++ b/drivers/staging/greybus/raw.c
> @@ -29,7 +29,7 @@ struct gb_raw {
>   struct raw_data {
>   	struct list_head entry;
>   	u32 len;
> -	u8 data[];
> +	u8 data[] __counted_by(len);
>   };
>   
>   static const struct class raw_class = {
> @@ -73,7 +73,7 @@ static int receive_data(struct gb_raw *raw, u32 len, u8 *data)
>   		goto exit;
>   	}
>   
> -	raw_data = kmalloc(sizeof(*raw_data) + len, GFP_KERNEL);
> +	raw_data = kmalloc(struct_size(raw_data, data, len), GFP_KERNEL);
>   	if (!raw_data) {
>   		retval = -ENOMEM;
>   		goto exit;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

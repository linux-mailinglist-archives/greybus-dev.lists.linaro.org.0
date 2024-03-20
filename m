Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 37629881161
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 12:56:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3245943FEF
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Mar 2024 11:56:42 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	by lists.linaro.org (Postfix) with ESMTPS id 5B6263F463
	for <greybus-dev@lists.linaro.org>; Wed, 20 Mar 2024 11:56:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=Jq1tlxxR;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.208.41 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-568aa3096e9so1412540a12.0
        for <greybus-dev@lists.linaro.org>; Wed, 20 Mar 2024 04:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710935798; x=1711540598; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FH7W+XVPP1mnMok1Pkpdeu03frvaBS4E23k4mFfPidA=;
        b=Jq1tlxxRwRsVrujK+ORZtfNC8/UbZZihjUr90QP0wcwVrWp/2mFsq/UuNMWcND917P
         Xkj7WKTsB3T1Dr3+AvuIf/B95ZX6a2M0VZTM0wk+diOSsKqON4XIZUHmFzHUkwaMjK/e
         hM92h6sYe614KLDovqEihsYi/UNVDlj4ruNiWWtPuQYNspnSvWX2BzEbFMyi+3FwrHse
         dBw0U2rb/Mawz3NZ5ZGrcDHii6DZpXpecC2oAyZg0qh2bChXkkzAN5J6t0kBaB+lSTaJ
         PM4jUg4ntx3Pt5ws7xAXCDFtvRVp4y8/byHqX8wJG+glHpaUq5UhJbpMrmBjluwsEyXs
         KaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710935798; x=1711540598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH7W+XVPP1mnMok1Pkpdeu03frvaBS4E23k4mFfPidA=;
        b=udSVS5Y/uiwuLyn9f7fcPZEpuJ+DSfeGzQ0L1cgPs6wf1f8QDQ0yTfS6nYCb0BZL8o
         X7J5Z7R32F74l2OvgyMPrHv9NgSeP46MCMJMIsbnE8ShUvyThRtqylZHkun+4oX5sec0
         2VxaZLm+e7W/XEBRaZQ/r9Hg7E9l5b8eIRgXLE4yNqiT7hih2sz7ovKVrvZIVWh4Yj0h
         YnbKmTfcfp0tEnjIhxcJ5kVabfaNRV8SVzVbfcoQ3GkKVL7woZ33IFRn8SleS90qB7KK
         EugEG9kIMbrLbga9Rg7h3MSDoMjWFonj5K5VV/KGoAoVF7divCtKVJFmvx2S1VLZYR8c
         WwLA==
X-Forwarded-Encrypted: i=1; AJvYcCWzeY8quGCGOgi8jghKtshQQMGdigASt7nYIHXlvNDNNF2aXxmCN/uZlXFq551Bhr+0nOH/HysaHW589MtN60XfTdXQGX87iB6Lex01
X-Gm-Message-State: AOJu0YwkaQkiEw0rgmsWVk8KZlggUORGqmfhHSbYNPfp4/d/tm/UfirB
	NASFR31vS7ZHhc7L2l/WVipcnSY5TBSf6DKs/SGK+3di0QFaHd1ZeUBnn/AybeL5wg==
X-Google-Smtp-Source: AGHT+IHXaB8NePf8kEDF74mZix6FJCLLunouDd0t/YTdjPNc84shp0nT2pD8txliKnB6MvR6X7W3qQ==
X-Received: by 2002:a17:906:4f03:b0:a46:301:dd98 with SMTP id t3-20020a1709064f0300b00a460301dd98mr1995254eju.13.1710935798158;
        Wed, 20 Mar 2024 04:56:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709064a1100b00a466e772597sm7311046eju.177.2024.03.20.04.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 04:56:37 -0700 (PDT)
Message-ID: <12c2369f-310f-493b-a090-0ba7aec98b70@linaro.org>
Date: Wed, 20 Mar 2024 12:56:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ayush Singh <ayushdevel1325@gmail.com>, linux-kernel@vger.kernel.org
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
 <8799b216-57a7-451b-80a3-3d4ae9693e0b@linaro.org>
 <402d1296-0a0c-4f85-a096-be7993869f94@gmail.com>
 <81d55f10-c538-494f-8274-6ea8c4366ab2@linaro.org>
 <28a5e314-30ba-4fc4-9228-51adb63e7aaa@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <28a5e314-30ba-4fc4-9228-51adb63e7aaa@gmail.com>
X-Rspamd-Queue-Id: 5B6263F463
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.41:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 242KIOYXRRP4CPWWHPNNI3F2ZW27U6XY
X-Message-ID-Hash: 242KIOYXRRP4CPWWHPNNI3F2ZW27U6XY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/242KIOYXRRP4CPWWHPNNI3F2ZW27U6XY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 19/03/2024 07:59, Ayush Singh wrote:
> On 3/19/24 11:02, Krzysztof Kozlowski wrote:
> 
>> On 16/03/2024 14:06, Ayush Singh wrote:
>>>   > Are you sure this fits in Linux coding style limit (not checkpatch
>>> limit, but the limit expressed by Linux coding style)?
>>>
>>>
>>> Well, I am just using clang-format with column width of 100 instead of
>>> 80. The docs now say 80 is prefered rather than mandatory, so well I was
>> So you introduce your own style? Then consider it mandatory...
>>
>>> using 100 since I prefer that. If 80 is necessary or would make review
>>> easier than I can just switch to it.
>> You do not choose your own coding style.
>>
>>>
>>> I will remove serdev, pwm, clickID and send a new patch with the minimal
>>> driver and better commit messages as suggested with Vaishnav. It is
>>> important to have good support for mikroBUS boards without clickID as well.
>> Best regards,
>> Krzysztof
>>
> 
> I mean after the whole discussion about 80 vs 100 column line limit a 

Yeah, and the discussion was saying: use 80, unless code readability is
improved by using 100-limit.

> few years ago, and change in checkpatch behavior, I thought 100 was an 
> acceptable column length in the kernel, but I guess was mistaken, and 80 
> character is still mandatory? Not sure why there was a change in 
> checkpatch and docs though.

You mistake checkpatch with coding style. What checkpatch tells you, is
a suggestion. It's not the coding style. The problem with checkpatch is
that people do not understand "why" it proposes something and they
implement its warnings literally, thus sometimes decreasing code
readability.

> 
> Regardless, I have switched 80 in the next patch since it is mandatory, 
> and I do not care as long as I can format using a formatter.

Please use wrapping as explained in coding style and deviate to 100
character limit only if it increases the readability.

Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

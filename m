Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98A7B6402
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 10:25:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4B53A3EAC1
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Oct 2023 08:25:16 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	by lists.linaro.org (Postfix) with ESMTPS id D90513EAC1
	for <greybus-dev@lists.linaro.org>; Tue,  3 Oct 2023 08:25:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="KgEay/vh";
	spf=pass (lists.linaro.org: domain of krzysztof.kozlowski@linaro.org designates 209.85.218.41 as permitted sender) smtp.mailfrom=krzysztof.kozlowski@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9a645e54806so104424566b.0
        for <greybus-dev@lists.linaro.org>; Tue, 03 Oct 2023 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696321508; x=1696926308; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2bY6XDMCFjLMddJSy0fwcwvyfFdNKLzGzXuO6BPqp9o=;
        b=KgEay/vh0Zr4ZYOosAaLhzQaZlFkPscGteLcPFd3Qr6fQthxCTzZEDtANoxynYhgWj
         W3AXC2VFiHgZ1EE57Xui5BQ9xM1AGNGrvAyzjHEV05zGgUlYf2ASLKRaYlDBBN52l5ZE
         zKE8GYUfBAi/Ay4GlcwI3I5+NL8zaoxiLixM5yfo2G3c+kV6gGBFQZc5gepaqX2ZMUzg
         citTWIgRJ6oIWrtqZzXd4YLSbE4W2f51DChseam3qm/05PvHVXYkLDEBhB6QO3n3xOQY
         i7QmvZNxqLggfYWPszOGWx2Lb2MQ8mDcV1NGwIf3atnyrTKGLif73YC8xejIZoxxgNsj
         tUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696321508; x=1696926308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bY6XDMCFjLMddJSy0fwcwvyfFdNKLzGzXuO6BPqp9o=;
        b=kgSP7FFbziivwOKxBlEMImpWBomy7XGF/F/VcTo1TIwRRcQctLw6cCx8/47UjEt4oX
         ZrG4GvRhxAlLKxneFXwJ0nb7RS17jWCO07OdkB5TOcOfVmbtT5JES+buFcKKUvvzT4/j
         iZjzHEg+8FYHLD8nCMXenTlW2Qt5xd46AndAOR5PxXBtCoppR/6sWkWgj2pXEVhDxos+
         oMkJy8bKcIz0BkDV1/62UTvUFw4iFXmuqsDTWU85ew4xqEuHl065Crac0YCHtuDkY+kk
         Ri4/g7lNHrY7vL3M4Kbxrf/ZLgxNkcbDgFzFD9uM8DwNTIfcUD6uaIfrSKl+LKAhEeS7
         NBHA==
X-Gm-Message-State: AOJu0YwT2jJRDMtnl8LDoR1fbfQjfvyHpsen1RcLjnPoRo2X8UEUFGK+
	2964PrTWDv7YIiy9UNCHsRAseQ7o
X-Google-Smtp-Source: AGHT+IFPS5aaphSwTiaqvTpYX4YmdYc5Gnqgp71R3ewY6X7RESlyVZPE+N2HYue90Jmz98vSOUP7mg==
X-Received: by 2002:a17:906:214:b0:9b2:7367:a699 with SMTP id 20-20020a170906021400b009b27367a699mr13148269ejd.42.1696321507781;
        Tue, 03 Oct 2023 01:25:07 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id sb8-20020a170906edc800b0099cf840527csm639065ejb.153.2023.10.03.01.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 01:25:07 -0700 (PDT)
Message-ID: <50a0de57-db28-424a-915d-fc6e00ae4758@linaro.org>
Date: Tue, 3 Oct 2023 10:25:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20231002182454.211165-1-ayushdevel1325@gmail.com>
 <20231002182454.211165-3-ayushdevel1325@gmail.com>
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
In-Reply-To: <20231002182454.211165-3-ayushdevel1325@gmail.com>
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.218.41:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	URIBL_BLOCKED(0.00)[linaro.org:dkim,mail-ej1-f41.google.com:helo,mail-ej1-f41.google.com:rdns,beagleboard.org:url];
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
	TAGGED_RCPT(0.00)[dt];
	BLOCKLISTDE_FAIL(0.00)[209.85.218.41:server fail];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D90513EAC1
Message-ID-Hash: N4E5E5B66F3PDXV6HJV4MYF573YUEXU7
X-Message-ID-Hash: N4E5E5B66F3PDXV6HJV4MYF573YUEXU7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N4E5E5B66F3PDXV6HJV4MYF573YUEXU7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 02/10/2023 20:24, Ayush Singh wrote:
> Add the Greybus host driver for BeaglePlay board by BeagleBoard.org.
> 
> The current greybus setup involves running SVC in a user-space
> application (GBridge) and using netlink to communicate with kernel
> space. GBridge itself uses wpanusb kernel driver, so the greybus messages
> travel from kernel space (gb_netlink) to user-space (GBridge) and then
> back to kernel space (wpanusb) before reaching CC1352.
> 
> This driver directly communicates with CC1352 (running SVC Zephyr
> application). Thus, it simplifies the complete greybus setup eliminating
> user-space GBridge.
> 

...

Thank you for your patch. There is something to discuss/improve.

> +
> +static int gb_serdev_init(struct gb_beagleplay *bg)
> +{
> +	u32 speed = 115200;
> +	int ret;
> +
> +	serdev_device_set_drvdata(bg->sd, bg);
> +	serdev_device_set_client_ops(bg->sd, &gb_beagleplay_ops);
> +	ret = serdev_device_open(bg->sd);
> +	if (ret)
> +		return dev_err_probe(&bg->sd->dev, ret, "Unable to open serial device");
> +
> +	speed = serdev_device_set_baudrate(bg->sd, speed);

Unused value speed. Probably this results in warnings. Plus it is a
confusing code. Check the return value if it is relevant. If it can be
ignored, skip assignment and drop "speed" variable.

Rest looks okay to me after glance (I did not perform full review).


> +	serdev_device_set_flow_control(bg->sd, false);
> +
> +	return 0;
> +}
> +
> +static int gb_beagleplay_probe(struct serdev_device *serdev)
> +{
> +	int ret = 0;
> +	struct gb_beagleplay *bg;
> +
> +	bg = devm_kmalloc(&serdev->dev, sizeof(*bg), GFP_KERNEL);
> +	if (!bg)
> +		return -ENOMEM;
> +
Best regards,
Krzysztof

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

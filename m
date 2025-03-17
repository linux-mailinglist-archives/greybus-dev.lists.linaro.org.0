Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 178B4A63ED0
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 05:59:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 24E8743C18
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 04:59:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 82AD83F51E
	for <greybus-dev@lists.linaro.org>; Mon, 17 Mar 2025 04:59:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=I+t8mhR4;
	spf=pass (lists.linaro.org: domain of jirislaby@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=jirislaby@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3611D5C2700;
	Mon, 17 Mar 2025 04:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D91C4CEEC;
	Mon, 17 Mar 2025 04:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742187547;
	bh=6VnMyDZwa6cw1ap/4K/skRrOVO89UvB+zZL65t5WJYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I+t8mhR44VuOprWH/sIp5oYYWtlC2cKIf5pcKH81Jol5XdGXk5C9bNFRZms0fsWZI
	 aedk/a4IKpG3aXkfxcWDu2xvmx5FtOE/+8JcR6C0vnEf7iFFbZvHn421f9phxmURVR
	 1ddRbsCRrWDfL5vHEktlpwk1eRYQbA2Abfvr+oX8FfQ6tflfodoM4veR3Kpdja/eDO
	 PchKIazdQRHOOErtgg7lFllw+ZEnXqNIuHt3S/rLlZeoWJ4zafYbYA0Tvef9FMVJbN
	 j6/LuzqmJz4mI0KbF+bif8QUjRnA7SuzaFiq1qpc7CX0hx7reTo5B1Rm9vk2p1twab
	 qO9hUfVGraFVA==
Message-ID: <e8fb71ea-84cb-427a-9dc9-9c44ec0db08f@kernel.org>
Date: Mon, 17 Mar 2025 05:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg KH <gregkh@linuxfoundation.org>
References: <20250220111606.138045-1-jirislaby@kernel.org>
 <2025031738-fabric-alright-6a32@gregkh>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 xsFNBE6S54YBEACzzjLwDUbU5elY4GTg/NdotjA0jyyJtYI86wdKraekbNE0bC4zV+ryvH4j
 rrcDwGs6tFVrAHvdHeIdI07s1iIx5R/ndcHwt4fvI8CL5PzPmn5J+h0WERR5rFprRh6axhOk
 rSD5CwQl19fm4AJCS6A9GJtOoiLpWn2/IbogPc71jQVrupZYYx51rAaHZ0D2KYK/uhfc6neJ
 i0WqPlbtIlIrpvWxckucNu6ZwXjFY0f3qIRg3Vqh5QxPkojGsq9tXVFVLEkSVz6FoqCHrUTx
 wr+aw6qqQVgvT/McQtsI0S66uIkQjzPUrgAEtWUv76rM4ekqL9stHyvTGw0Fjsualwb0Gwdx
 ReTZzMgheAyoy/umIOKrSEpWouVoBt5FFSZUyjuDdlPPYyPav+hpI6ggmCTld3u2hyiHji2H
 cDpcLM2LMhlHBipu80s9anNeZhCANDhbC5E+NZmuwgzHBcan8WC7xsPXPaiZSIm7TKaVoOcL
 9tE5aN3jQmIlrT7ZUX52Ff/hSdx/JKDP3YMNtt4B0cH6ejIjtqTd+Ge8sSttsnNM0CQUkXps
 w98jwz+Lxw/bKMr3NSnnFpUZaxwji3BC9vYyxKMAwNelBCHEgS/OAa3EJoTfuYOK6wT6nadm
 YqYjwYbZE5V/SwzMbpWu7Jwlvuwyfo5mh7w5iMfnZE+vHFwp/wARAQABzSFKaXJpIFNsYWJ5
 IDxqaXJpc2xhYnlAa2VybmVsLm9yZz7CwXcEEwEIACEFAlW3RUwCGwMFCwkIBwIGFQgJCgsC
 BBYCAwECHgECF4AACgkQvSWxBAa0cEnVTg//TQpdIAr8Tn0VAeUjdVIH9XCFw+cPSU+zMSCH
 eCZoA/N6gitEcnvHoFVVM7b3hK2HgoFUNbmYC0RdcSc80pOF5gCnACSP9XWHGWzeKCARRcQR
 4s5YD8I4VV5hqXcKo2DFAtIOVbHDW+0okOzcecdasCakUTr7s2fXz97uuoc2gIBB7bmHUGAH
 XQXHvdnCLjDjR+eJN+zrtbqZKYSfj89s/ZHn5Slug6w8qOPT1sVNGG+eWPlc5s7XYhT9z66E
 l5C0rG35JE4PhC+tl7BaE5IwjJlBMHf/cMJxNHAYoQ1hWQCKOfMDQ6bsEr++kGUCbHkrEFwD
 UVA72iLnnnlZCMevwE4hc0zVhseWhPc/KMYObU1sDGqaCesRLkE3tiE7X2cikmj/qH0CoMWe
 gjnwnQ2qVJcaPSzJ4QITvchEQ+tbuVAyvn9H+9MkdT7b7b2OaqYsUP8rn/2k1Td5zknUz7iF
 oJ0Z9wPTl6tDfF8phaMIPISYrhceVOIoL+rWfaikhBulZTIT5ihieY9nQOw6vhOfWkYvv0Dl
 o4GRnb2ybPQpfEs7WtetOsUgiUbfljTgILFw3CsPW8JESOGQc0Pv8ieznIighqPPFz9g+zSu
 Ss/rpcsqag5n9rQp/H3WW5zKUpeYcKGaPDp/vSUovMcjp8USIhzBBrmI7UWAtuedG9prjqfO
 wU0ETpLnhgEQAM+cDWLL+Wvc9cLhA2OXZ/gMmu7NbYKjfth1UyOuBd5emIO+d4RfFM02XFTI
 t4MxwhAryhsKQQcA4iQNldkbyeviYrPKWjLTjRXT5cD2lpWzr+Jx7mX7InV5JOz1Qq+P+nJW
 YIBjUKhI03ux89p58CYil24Zpyn2F5cX7U+inY8lJIBwLPBnc9Z0An/DVnUOD+0wIcYVnZAK
 DiIXODkGqTg3fhZwbbi+KAhtHPFM2fGw2VTUf62IHzV+eBSnamzPOBc1XsJYKRo3FHNeLuS8
 f4wUe7bWb9O66PPFK/RkeqNX6akkFBf9VfrZ1rTEKAyJ2uqf1EI1olYnENk4+00IBa+BavGQ
 8UW9dGW3nbPrfuOV5UUvbnsSQwj67pSdrBQqilr5N/5H9z7VCDQ0dhuJNtvDSlTf2iUFBqgk
 3smln31PUYiVPrMP0V4ja0i9qtO/TB01rTfTyXTRtqz53qO5dGsYiliJO5aUmh8swVpotgK4
 /57h3zGsaXO9PGgnnAdqeKVITaFTLY1ISg+Ptb4KoliiOjrBMmQUSJVtkUXMrCMCeuPDGHo7
 39Xc75lcHlGuM3yEB//htKjyprbLeLf1y4xPyTeeF5zg/0ztRZNKZicgEmxyUNBHHnBKHQxz
 1j+mzH0HjZZtXjGu2KLJ18G07q0fpz2ZPk2D53Ww39VNI/J9ABEBAAHCwV8EGAECAAkFAk6S
 54YCGwwACgkQvSWxBAa0cEk3tRAAgO+DFpbyIa4RlnfpcW17AfnpZi9VR5+zr496n2jH/1ld
 wRO/S+QNSA8qdABqMb9WI4BNaoANgcg0AS429Mq0taaWKkAjkkGAT7mD1Q5PiLr06Y/+Kzdr
 90eUVneqM2TUQQbK+Kh7JwmGVrRGNqQrDk+gRNvKnGwFNeTkTKtJ0P8jYd7P1gZb9Fwj9YLx
 jhn/sVIhNmEBLBoI7PL+9fbILqJPHgAwW35rpnq4f/EYTykbk1sa13Tav6btJ+4QOgbcezWI
 wZ5w/JVfEJW9JXp3BFAVzRQ5nVrrLDAJZ8Y5ioWcm99JtSIIxXxt9FJaGc1Bgsi5K/+dyTKL
 wLMJgiBzbVx8G+fCJJ9YtlNOPWhbKPlrQ8+AY52Aagi9WNhe6XfJdh5g6ptiOILm330mkR4g
 W6nEgZVyIyTq3ekOuruftWL99qpP5zi+eNrMmLRQx9iecDNgFr342R9bTDlb1TLuRb+/tJ98
 f/bIWIr0cqQmqQ33FgRhrG1+Xml6UXyJ2jExmlO8JljuOGeXYh6ZkIEyzqzffzBLXZCujlYQ
 DFXpyMNVJ2ZwPmX2mWEoYuaBU0JN7wM+/zWgOf2zRwhEuD3A2cO2PxoiIfyUEfB9SSmffaK/
 S4xXoB6wvGENZ85Hg37C7WDNdaAt6Xh2uQIly5grkgvWppkNy4ZHxE+jeNsU7tg=
In-Reply-To: <2025031738-fabric-alright-6a32@gregkh>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 82AD83F51E
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.98%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[139.178.84.217:from];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_RCPT(0.00)[netdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	URIBL_BLOCKED(0.00)[dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lunn.ch,linux.intel.com,gmail.com,davemloft.net,google.com,lists.linaro.org,lists.linux.dev,redhat.com,linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: 4WAJL2F4GFC2SGMKNMCD2X5ZESNUUNYN
X-Message-ID-Hash: 4WAJL2F4GFC2SGMKNMCD2X5ZESNUUNYN
X-MailFrom: jirislaby@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Lin <dtwlin@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, greybus-dev@lists.linaro.org, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, linux-alpha@vger.kernel.org, linux-staging@lists.linux.dev, Matt Turner <mattst88@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Rob Herring <robh@kernel.org>, sparclinux@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/29] tty: cleanup no. 99
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4WAJL2F4GFC2SGMKNMCD2X5ZESNUUNYN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 17. 03. 25, 5:28, Greg KH wrote:
> On Thu, Feb 20, 2025 at 12:15:37PM +0100, Jiri Slaby (SUSE) wrote:
>> Hi,
>>
>> this is (again) a series of cleanup in tty. I am trying to rework
>> tty+serial to avoid limitations of devices (so called NR_UART or
>> tty_alloc_driver()'s first parameter). And the below popped up while
>> crawling through the code. So this is only a prep cleanup.
>>
>> * many tty flags are now enums
>> * many functions were improved for readability
>> * quite a few unused or old code dropped
>>
>> In particular, the runtime behaviour of the kernel before and after the
>> changes is supposed to be bug to bug compatible (except moxa's ioctl
>> and ISA evils dropped). That is, noone should notice.
> 
> Were you going to do a new respin of this, or do you want me to take
> this as-is and you will send a follow-up ones for the commented-on
> changes?

I planned to send a v2 on Fri, but did not make it. I will today.

thanks,
-- 
js
suse labs
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

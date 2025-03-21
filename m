Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D21A6BCB1
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Mar 2025 15:15:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CDF4A44A4A
	for <lists+greybus-dev@lfdr.de>; Fri, 21 Mar 2025 14:15:37 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	by lists.linaro.org (Postfix) with ESMTPS id 6AD0D4410C
	for <greybus-dev@lists.linaro.org>; Fri, 21 Mar 2025 14:14:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=YE4Bl6n8;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.222.170 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5675dec99so233400385a.0
        for <greybus-dev@lists.linaro.org>; Fri, 21 Mar 2025 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1742566487; x=1743171287; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9exEh3HjSKqcTsxFRqa5eN4Zk07lWBlI5tYJFrmxJok=;
        b=YE4Bl6n8Vnr8PUGfKLRyXkgRkKw3O2lUoMvEV0rYJDwtGYtkbLqBA3QFdEXccQa9mP
         bpAAp8aT7xyjjtb2zoMevk9cQTvNUaDVMczg/s213xXv1uuiPodqAqvidYrU1eWm/GDy
         lfftc9Ph1D8+ba5vbn+JAnGsSDprDKX1Nsvec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566487; x=1743171287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9exEh3HjSKqcTsxFRqa5eN4Zk07lWBlI5tYJFrmxJok=;
        b=vSynSFo0cHcGmO+pORrsCJLobeFjlVvDy4wvEjLMWteXGU2lAFyDBAe5jw2OiW0y62
         6nFKkjlHvnOqK0QVrgXMX1wppURvgeqUAX5apQ09JfZi3ci/p7IhTaXH1XuZQIqFkeNA
         Gu1jUbrDOn3rjvqloGenTGYTo7nD+DOnWcPAByG5ZIlMgnbikMqXOPq8ggkWu9VjNULz
         LMJ36wWNhHbfdB8/DNUd+L/yf4ooWQrDl9gMOwwwklOGP2DXYeSq709Gs/AipqKn+yyM
         2B1rzFwbyKMFlF3659XxeVf0MCZ9pOmv/q3XOZtGMl/9rGwFjJnFDYxmo0xigBUtzk71
         5wpA==
X-Gm-Message-State: AOJu0Yz/CvVaL/L2+BNjgbkNZCRSKRCUwP4k59rPZUrvDZw2K00Bo3aY
	ReZbNDQwuyircVe6OxqMEViwFHeYfOmdztcabMZGirKeLMDGm4s1dvHHPGWFtg==
X-Gm-Gg: ASbGnctuMHepf7f3ZVYHzLI5C6WRLE3eckGgYop4K5EM8+2IMqAk0IdpdN0Fspfrti5
	7vBFDg8bSdFFC9tqpiLRojl1WiUgZD09/q47ZLLIdqU7xnbrFkhmBGEm20PVqJPoz4/XzH6Acu7
	osYCT2IGYXi8j+GBRM2tqyUPTCUSBMntcAqzaqRHRzsKnjdQzNwr5+p0a4EE1mpx0LnPrji5rH0
	pU18rZysjHevJUrvYgPycdiNIxqvLAEJkG4mJt/m0PKvOlHRRvXNBxo9SObPRqGFEGkWshsJjKp
	yi26NfVOFGfDIIMd7q/i0/YyM/0u8kZ8BKrfZs8L1AqLXMIMgmdRWTVJDA2lGd1nF7tf7UeUp7W
	+Ken++NOHvfiWaUfEasy9C1k=
X-Google-Smtp-Source: AGHT+IEAlcWkAnwmrnQqtFTWuwfNBTAEVhK3IQoOiYeHqUDv1MVsDaGZ5Aw/RjXX/sF8QL3K1Ct2sw==
X-Received: by 2002:a05:620a:390a:b0:7c5:5d4b:e621 with SMTP id af79cd13be357-7c5ba1e3f3amr432552285a.37.1742566486918;
        Fri, 21 Mar 2025 07:14:46 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-7c5b935772fsm134988485a.91.2025.03.21.07.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 07:14:46 -0700 (PDT)
Message-ID: <24b17317-a153-404c-af67-79967bf49968@ieee.org>
Date: Fri, 21 Mar 2025 09:14:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ErickKaranja <karanja99erick@gmail.com>, hvaibhav.linux@gmail.com,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 outreachy@lists.linux.dev
References: <20250321115545.24468-1-karanja99erick@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250321115545.24468-1-karanja99erick@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6AD0D4410C
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_TRACE(0.00)[ieee.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.170:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.222.170:from,73.228.159.35:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.222.170:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UZ4T6LLN6ZH2O4PNZ3QAUJUFTQF2WOM5
X-Message-ID-Hash: UZ4T6LLN6ZH2O4PNZ3QAUJUFTQF2WOM5
X-Mailman-Approved-At: Fri, 21 Mar 2025 14:15:36 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix line length issue
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UZ4T6LLN6ZH2O4PNZ3QAUJUFTQF2WOM5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 3/21/25 6:55 AM, ErickKaranja wrote:
> Fix line length exceeding 100 columns in arche-platform.c. The code now
> follows Linux kernel coding style guidelines by keeping lines under the
> maximum allowed length of 100 characters.
> 
> Reported by checkpatch:
> 
> CHECK: line length of 101 exceeds 100 columns
> 
> Signed-off-by: ErickKaranja <karanja99erick@gmail.com>

Sometimes a good strategy for reducing long lines (which, as in this
case, is partially due to indentation) is to define a helper function
to isolate the code (and reduce the indentation level).

Another approach can be to define local variables so that the arguments
don't make the line too long.  Here though, the name of the function
(arche_platform_set_wake_detect_state()) is pretty wide.

Ultimately the goal is readability and comprehension.  It's not always
cut and dried the best way to improve things.

					-Alex


> ---
>   drivers/staging/greybus/arche-platform.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
> index d48464390f58..1a82a7a3991c 100644
> --- a/drivers/staging/greybus/arche-platform.c
> +++ b/drivers/staging/greybus/arche-platform.c
> @@ -179,8 +179,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
>   				 */
>   				if (arche_pdata->wake_detect_state !=
>   						WD_STATE_COLDBOOT_START) {
> -					arche_platform_set_wake_detect_state(arche_pdata,
> -									     WD_STATE_COLDBOOT_TRIG);
> +					arche_platform_set_wake_detect_state
> +						(arche_pdata, WD_STATE_COLDBOOT_TRIG);
>   					spin_unlock_irqrestore(&arche_pdata->wake_lock,
>   							       flags);
>   					return IRQ_WAKE_THREAD;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

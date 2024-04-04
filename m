Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B987F8990F8
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Apr 2024 00:05:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6632D43FEF
	for <lists+greybus-dev@lfdr.de>; Thu,  4 Apr 2024 22:05:13 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	by lists.linaro.org (Postfix) with ESMTPS id 9A2D93F086
	for <greybus-dev@lists.linaro.org>; Thu,  4 Apr 2024 22:05:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=a61kmWtZ;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.210.180 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso853121b3a.2
        for <greybus-dev@lists.linaro.org>; Thu, 04 Apr 2024 15:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1712268311; x=1712873111; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sy7266lMQnSMjMFEHXw5ktQWimUH2FejCxx70Ap0ANM=;
        b=a61kmWtZ6NhmNdqs4iPNllv8VksBA23TEFwSFY6r/0vh32leeBAYzH0CUrGloqZxj0
         8Gr+HhtzWOV2sqJbAa3JZRo+2a08uPnJYkGcZ7K48RjnGgwmgs+h2aaGYEMK94OdOrfR
         3wTKLcdsmt0H+gQvCBO4AqynUL2IaPZuLbhVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712268311; x=1712873111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy7266lMQnSMjMFEHXw5ktQWimUH2FejCxx70Ap0ANM=;
        b=Jd1m4NoABTtdQffgVmV+FBL1UcGhfV/0mbjWMS+Od0j4Ca42jrcEK2esKThO354tg7
         EhyqlRKStcAPssuuoPCq+CLuRpIz/IgBm7a+Al2EmQX8f2N/mWLmgW4TdG0/RrA8rUeJ
         Mbv0LX5VEBrEWo5goTr56ADReumRf0s+AN5Xt/V7Tn66KDLwGfKHo0sAsRIgPUIUGtfH
         /tBu7SnlWSis1G28FivfdlyMeT0ygh4aaicblcN/hZK9YAZvZ+Llzw1av/zAvgQArvnY
         zYBOucZzodxpbjqUwldwSSdnwTdqD1WCR66YvkblYyKIg87oNOvFalOp7Si7UyTt8Rw9
         t7/w==
X-Forwarded-Encrypted: i=1; AJvYcCVrjiJzjbK1klZ+LtSFofwDH+7sffSBFe7eVeLa368wbU6kenJxCgbl+K6deb3kJGW9KLTU3OXdSTsy+2wra2E1Af2lXYw+2v9lp2RV
X-Gm-Message-State: AOJu0Yx6XkygbPh/WAoqmNmbgCcFD1bKnJeNuj6mI/H1cNdR5AYf5Sl3
	ydHYi1yX+U/zX039V1KeLZ3h6Tk825y88to/t2JDs689O3dG8a6zs+hRS699Rw==
X-Google-Smtp-Source: AGHT+IE5nA/OpbcSy/r9kgCd3Js80VOlnXWp2HYIjgdhUy7KW36EOroFso0nwx9xB8SpB9KKftjehA==
X-Received: by 2002:aa7:8894:0:b0:6ea:d004:33c9 with SMTP id z20-20020aa78894000000b006ead00433c9mr960813pfe.30.1712268310720;
        Thu, 04 Apr 2024 15:05:10 -0700 (PDT)
Received: from [10.211.55.3] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.googlemail.com with ESMTPSA id j17-20020a056a00131100b006e6b989514bsm139111pfu.60.2024.04.04.15.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 15:05:10 -0700 (PDT)
Message-ID: <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
Date: Thu, 4 Apr 2024 17:05:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jackson Chui <jacksonchui.qwerty@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
X-Rspamd-Queue-Id: 9A2D93F086
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.59 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.180:from];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	URIBL_BLOCKED(0.00)[ieee.org:dkim];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: TJM4F5RFGNNTSSKJBPX4WEG7YEUS5OBL
X-Message-ID-Hash: TJM4F5RFGNNTSSKJBPX4WEG7YEUS5OBL
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Clear up precedence for gcam logging macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TJM4F5RFGNNTSSKJBPX4WEG7YEUS5OBL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit

On 4/3/24 7:16 PM, Jackson Chui wrote:
> Reported by checkpatch:
> 
> CHECK: Macro argument 'gcam' may be better as '(gcam)' to avoid
> precedence issues

I agree with your argument about the way the macro should be
defined.  But perhaps these gcam_*() functions could just
be eliminated?

I see 15 calls to gcam_err(), 1 call to gcam_dbg(), and none
to gcam_info().  It would be a different patch, but maybe
you could do that instead?

					-Alex


> 
> Disambiguates '&' (address-of) operator and '->' operator precedence,
> accounting for how '(gcam)->bundle->dev' is a 'struct device' and not a
> 'struct device*', which is required by the dev_{dbg,info,err} driver
> model diagnostic macros. Issue found by checkpatch.
> 
> Signed-off-by: Jackson Chui <jacksonchui.qwerty@gmail.com>
> ---
>   drivers/staging/greybus/camera.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index a8173aa3a995..d82a2d2abdca 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -180,9 +180,9 @@ static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_fmt)
>   
>   #define GB_CAMERA_MAX_SETTINGS_SIZE	8192
>   
> -#define gcam_dbg(gcam, format...)	dev_dbg(&gcam->bundle->dev, format)
> -#define gcam_info(gcam, format...)	dev_info(&gcam->bundle->dev, format)
> -#define gcam_err(gcam, format...)	dev_err(&gcam->bundle->dev, format)
> +#define gcam_dbg(gcam, format...)	dev_dbg(&((gcam)->bundle->dev), format)
> +#define gcam_info(gcam, format...)	dev_info(&((gcam)->bundle->dev), format)
> +#define gcam_err(gcam, format...)	dev_err(&((gcam)->bundle->dev), format)
>   
>   static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>   					  int type, unsigned int flags,

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

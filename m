Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D93859312
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Feb 2024 22:58:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 83A2744714
	for <lists+greybus-dev@lfdr.de>; Sat, 17 Feb 2024 21:58:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id 481A044714
	for <greybus-dev@lists.linaro.org>; Sat, 17 Feb 2024 21:58:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=chromium.org header.s=google header.b=VA4ZFUti;
	spf=pass (lists.linaro.org: domain of keescook@chromium.org designates 209.85.214.180 as permitted sender) smtp.mailfrom=keescook@chromium.org;
	dmarc=pass (policy=none) header.from=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d7881b1843so27746475ad.3
        for <greybus-dev@lists.linaro.org>; Sat, 17 Feb 2024 13:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708207120; x=1708811920; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2udDkf3nnvuGOZcbthLGLXbiEAUsVkkHJpuyz93NVo4=;
        b=VA4ZFUtiX6TvcakPC7RMjyIDynr4nktM403pewJiOc5rj9lCaPnwwo5seJ2i3SJ9I6
         SbxR1/ajilvD5PxaxYNODBsKCQDWcMfWU1N6ZKngNUnMyerS7Yd4HD4PCgPhCCtdXJY4
         IdyEUqN7WEuMA0hhABM36giFKwuJbsX8t7294=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708207120; x=1708811920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2udDkf3nnvuGOZcbthLGLXbiEAUsVkkHJpuyz93NVo4=;
        b=crO354YrsEdlwmswOcTpDe7tbknxr3RvJCYwNXS3G/0pEoc2qjSom+z0+36s8Dv/80
         dVvldzu1yQrPvZgorLKuM317uVWz+L36Xy5fWvfmwSRaPiLQDLnsz3aR4BnUFVab1e6I
         LBGT3dSarsacGU1fLzFkvNvwiOr1AkutaYhqQZqU1BRBLaWeWoTD49ZODK2p9noqgOwn
         5ncI5rvWPl5OtUBXRV/1wjx5HY5hwN6Ac3BQ1qyPYSoLZb9XN4MAQGr1IFlAkos/qcta
         mAepSGJu8KwSIEQEIrtozvz8IGw6gJ//v1h6W2Mmy6m5xtB6uLFZcilHsYxEm60fSkJ0
         nPqA==
X-Forwarded-Encrypted: i=1; AJvYcCX2+Cg7UGvrKq4bSMGOjUTB+y7Pa2qEig6Xeaw6Yr9GQ2YQcJ/Zdh4Z/NBa3XkytKbMEQw4m7DgMfLdNYcj2n+66tXXt9hYAXZ+wOqt
X-Gm-Message-State: AOJu0YwGR31s3nMTngrqttoVjDVztDIxrVIS04Q7VrdRCOESWNUMBMr0
	RTxtNHEtf5IaA7v7IEC7noElqS2Ws04ALoGj+dGLO9fOKXeP9L6pAunhUnLiCw==
X-Google-Smtp-Source: AGHT+IHOMhJGSekMFv4rEX09CV/DMe6NhlrWe0tPcvwNf9MdbYiiO6SbhgkLkSoAEiSdMjj1pRgGYg==
X-Received: by 2002:a17:903:98f:b0:1db:b495:1391 with SMTP id mb15-20020a170903098f00b001dbb4951391mr5503536plb.36.1708207120363;
        Sat, 17 Feb 2024 13:58:40 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id mi11-20020a170902fccb00b001db608107ecsm1865857plb.167.2024.02.17.13.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 13:58:39 -0800 (PST)
Date: Sat, 17 Feb 2024 13:58:39 -0800
From: Kees Cook <keescook@chromium.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <202402171357.E671B5589@keescook>
References: <20240216232824.work.862-kees@kernel.org>
 <672fafca-547e-443e-8dd8-80ccd2320767@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <672fafca-547e-443e-8dd8-80ccd2320767@ieee.org>
X-Rspamd-Queue-Id: 481A044714
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[chromium.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 7XFSRQF6KI3YKNA3DPCIG3WY72CZVZGC
X-Message-ID-Hash: 7XFSRQF6KI3YKNA3DPCIG3WY72CZVZGC
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "Gustavo A . R . Silva" <gustavo@embeddedor.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7XFSRQF6KI3YKNA3DPCIG3WY72CZVZGC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 17, 2024 at 02:17:33PM -0600, Alex Elder wrote:
> On 2/16/24 5:28 PM, Kees Cook wrote:
> > FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
> > code base has been converted to flexible arrays. In order to enforce
> > the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
> > destinations need to be handled. Instead of converting an empty struct
> > into using a flexible array, just directly use a pointer without any
> > additional indirection. Remove struct gb_bootrom_get_firmware_response
> > and struct gb_fw_download_fetch_firmware_response.
> 
> The only down side I see is that it sort of disrupts a pattern
> used on Greybus request handlers (and the response structure definitions).
> 
> I think a one-line comment in place of each of these two
> definitions would be helpful, something like:
> /* gb_fw_download_fetch_firmware_response contains no data */

Er, maybe this should be "no other data" ? Do you want a v2 of this
patch?

> And then add a similar comment above the calls to
> gb_operation_response_alloc().
> 
> Otherwise this looks good.
> 
> Reviewed-by: Alex Elder <elder@linaro.org>

Thanks!

-- 
Kees Cook
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

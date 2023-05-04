Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BADC6F6E44
	for <lists+greybus-dev@lfdr.de>; Thu,  4 May 2023 16:53:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9E6F74435C
	for <lists+greybus-dev@lfdr.de>; Thu,  4 May 2023 14:53:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id D85DC3EF1C
	for <greybus-dev@lists.linaro.org>; Thu,  4 May 2023 14:53:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=QhHC7viA;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.45 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f173af665fso4678455e9.3
        for <greybus-dev@lists.linaro.org>; Thu, 04 May 2023 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683211997; x=1685803997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lX/T27vjnEh8k9QeLjynwVpeQJ5Iqp1VjSSNsMcOBEs=;
        b=QhHC7viAls5QeeFDlr8Zxb6K0EZlwkRgePgufMqP08s34GEK45rZTvj2Rj0/EqNLwA
         0Q+PVahifxAYy4wnJlt9nFHcBO7gk7AROz7YCRzAHQfRbx4Wo9UFBw17ogFSOIED4oJb
         gCytz7C0GpOpIhQZ1PfuA3F3D5rT4vd4/xSlS7xjHQeB+lU3PcxRBkB3hevXwIsDb3I+
         3c8PtSzJvJ8ZVqosi1ECeolxhcEiPAD39C6nnBdMtuCuoT9zuNXi8BvX8fvja3JotePN
         fgOMDJhHJKF62H3E29aJw1a/vYRCCKoCk/H4RLqencEaoHC4TfjiEKDR+5myMhwr7t0z
         Og7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683211997; x=1685803997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lX/T27vjnEh8k9QeLjynwVpeQJ5Iqp1VjSSNsMcOBEs=;
        b=MkV7G3NqEC/YPERT7SJQ4kz2pI0qAyP1jacqqgskgtLFu1pThoVIYT8SF4zIHbGt5K
         hOUDILY8ifNRu/VuzaJISGv5R4B3YJfaqqM99xiIp/6Y8sr1sLG6W86dcCgzGqZr5oAu
         qqEzL3YUa3UHed6hZ4wnET1RElNphijFALcj3npxBINK01j4FVTFzCFfUnxRomjLUHW5
         DdpPqHrNGp09rp3wl4LAA1+zS5vvBI0yIJYuJD5ByQh4R1klV6+IRQnf1Au46pLKhVdq
         IqGwPXS/akQUkOCNDvbNFmxKllY59w040xSxpvS8Fkxr9uOYmgSyA1A4GZZLKxR+6ZKz
         Jwsg==
X-Gm-Message-State: AC+VfDzxBCyDL2c1gtaUIhU1r7bWCT2z9rWPiShZDlLoNM7vvlySvxgb
	T9X8HfQoZu0SfSxH9Kp/P2eB2Ru9
X-Google-Smtp-Source: ACHHUZ6GzN7URCucXGCsHRKXlnQyu6W06FtpSOkUPc/LLEF2fjxm7I4m5YoT/ZUAKJT3AvAfP/qXmw==
X-Received: by 2002:a05:600c:2104:b0:3f1:6f44:ff3a with SMTP id u4-20020a05600c210400b003f16f44ff3amr17146491wml.13.1683211996867;
        Thu, 04 May 2023 07:53:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m20-20020a7bce14000000b003f3195be0a0sm5161389wmc.31.2023.05.04.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 07:53:15 -0700 (PDT)
Date: Thu, 4 May 2023 17:53:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Message-ID: <bc5546c0-2c16-4b2d-ada1-c6dcf1d8c1a4@kili.mountain>
References: <20230504135841.1566958-1-dzm91@hust.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504135841.1566958-1-dzm91@hust.edu.cn>
X-Spamd-Result: default: False [-9.50 / 15.00];
	DWL_DNSWL_HI(-3.50)[linaro.org:dkim];
	BAYES_HAM(-3.00)[99.99%];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.128.45:from,102.36.222.112:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.45:from];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D85DC3EF1C
X-Spamd-Bar: ---------
Message-ID-Hash: 5MDLAPTAEJKJMLRUIDQNZ6LRCY2RW37C
X-Message-ID-Hash: 5MDLAPTAEJKJMLRUIDQNZ6LRCY2RW37C
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jacopo Mondi <jacopo.mondi@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman <gregkh@google.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] drivers: staging: greybus: fix GPF issue in gb_camera_capture
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5MDLAPTAEJKJMLRUIDQNZ6LRCY2RW37C/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 04, 2023 at 09:58:41PM +0800, Dongliang Mu wrote:
> In gb_camera_capture(), it does not check the value of settings
> before dereferencing it. And gb_camera_debugfs_capture calls
> gb_camera_capture with the 6th parameter settings as NULL.
> 
> Fix this by checking the value of setting at the starting of
> gb_camera_capture.
> 
> Fixes: 3265edaf0d70 ("greybus: Add driver for the camera class protocol")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---

No.  The original code is correct.  memcpy(p, NULL, 0); is allowed.

I don't see a bug.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

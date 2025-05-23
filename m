Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D1457AC1E7C
	for <lists+greybus-dev@lfdr.de>; Fri, 23 May 2025 10:19:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 230424551D
	for <lists+greybus-dev@lfdr.de>; Fri, 23 May 2025 08:19:51 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	by lists.linaro.org (Postfix) with ESMTPS id E71E945515
	for <greybus-dev@lists.linaro.org>; Fri, 23 May 2025 08:19:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b="kCd71lW/";
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.48 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4c4e6a0ccso128941f8f.3
        for <greybus-dev@lists.linaro.org>; Fri, 23 May 2025 01:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747988387; x=1748593187; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=flkPxGTAPulzErROQlZpjAXNRqaIuRh5Y/yxPEIKvFM=;
        b=kCd71lW/dYKr0AU/5/TrW5unthVcF5e3/NjA1HMr4TIU59MyyuajyUQZ6CbOaQDHZc
         6117Oul8dyG8TI6vtgRagVzvxgE2FNnKKZYUhan+c+sk6SzkWG2Kko1yGr8bfkg6EQcY
         8SXStb0FnGMzA8PbAQAy/KdoklYubXzFpkvT1iIOiRusWIbJJgMlyCYHc4MMzti6dO54
         s6maz7SdCzgQAxm4L06Wmh1SBk3byplWUNWE1Q7cMZDRWmCEQpodrkh3oG7RJs9iYGCn
         /Iv75/YwafC1O3pf3KmcllYSyNCIHlmorKFnlm8CBovssxHGEE0+RugBt653PN+hK7kZ
         J9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988387; x=1748593187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flkPxGTAPulzErROQlZpjAXNRqaIuRh5Y/yxPEIKvFM=;
        b=MnbDJEtRRKmmTRogE+33n7a/wyX5dUXeYP4Xy3g8tYaXZ0gxwDPNZOwe3lRNlD715o
         /6iOZVi34mvSEPvMJcfkGnD6UPkCoRTqbdsqfGcizzTD239uzn4bK/Ty2n5vZm1ZfqR9
         6p66BaCE2J5b2WTcGXCgYl3D/ovZfLZcGCVnkBJgDl1Dgr1XXRhXQ/ZqYcYEGlGSP683
         k14oB3M/ims3a4ZWodANKNr384vfUjhWIy1EnGNEHrTIMC9KfJmtiwfpns6oppOEGLUa
         dxBH3ytU8XRPNq0SKrU7BY7tOz0dKm5FpykrT4mAUHQ17S+wkAmCxzs11Cj0z2XnnJEt
         azTg==
X-Forwarded-Encrypted: i=1; AJvYcCWbvf8YrWW4jGxwR8xYWg720rRzlwZIWb39iyCeKrnESb5L3MTNMImxbLulTyv9qltQePmijJ1qecWQOg==@lists.linaro.org
X-Gm-Message-State: AOJu0YyEjXJa14PDzb6ptt5S2QQmEsDobbokyEzZSuLa78ZwJfqAYrRV
	8BkfjsJM/h2hZpWRgZwlIQ4KVM/WQl5ycBrNmjhhxU/btA3D0dZMeH6jWBeK0napuhc7FQ==
X-Gm-Gg: ASbGnctku3pTGeXliQ/8UatXmRO8vr+1vOU/WyQRDb3QcPvSvrTfFTe6X77sPeUGjP7
	DAGEtgRsWVpWj65mtznjKywFgBqYV2+98fQwQn8QtPoEsIaZvDDLemP7tAVFpZgD1Kkfw7DaBc9
	VzHw7mU51+VYXjTTrjHDQVgwb+ja/JLrIP/wOsOokHXkUxIlwuL3wsj0Js3GK4YWuFZIK0irqHs
	FXhq573P+/umYNV5GhoLqKg5tXCXD7W5bsxiTYjq3+Kf95iT45P5lqKF+JenEpKlO50KZkHBX7g
	EaQSU3RjFc/kMsR+kMSNYlHGiXxHke89dYiVn/z2CihjQqSJqPLvOX6X
X-Google-Smtp-Source: AGHT+IF4/Q3PO7+Wp7rssB2fh/14f8yoGc7vb2xypco+l1dme8+hwhmvGGV/4fhj0blkBQdH6++bgw==
X-Received: by 2002:a5d:64c7:0:b0:3a3:77cc:539a with SMTP id ffacd0b85a97d-3a4c2103d41mr2588162f8f.58.1747988386849;
        Fri, 23 May 2025 01:19:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca88978sm26223360f8f.65.2025.05.23.01.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:19:46 -0700 (PDT)
Date: Fri, 23 May 2025 11:19:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: rujra <braker.noob.kernel@gmail.com>
Message-ID: <aDAvnmtgnssj7K5l@stanley.mountain>
References: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG+54DZgF55R2pEtkVBdnwXEyNu9TrSMA9zkmw7RjWrDqX4SsQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [0.48 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.02)[53.14%];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.48:from];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Queue-Id: E71E945515
X-Spamd-Bar: /
Message-ID-Hash: BYJNVZJFIOP7GNV6HM7MBAVPZ4CM2G3S
X-Message-ID-Hash: BYJNVZJFIOP7GNV6HM7MBAVPZ4CM2G3S
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BYJNVZJFIOP7GNV6HM7MBAVPZ4CM2G3S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 17, 2025 at 09:11:30AM +0530, rujra wrote:
> To ensuring that the firmware_tag is properly null-terminated. When
> copying firmware tag strings to prevent buffer overflows and ensure
> data integrity.
> 
> The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE = 10 bytes, and it
> may or may not be NULL-terminated.
> included in "greybus_firmware.h"
> 
> changes has been made at 3 positions:
> 1: update firmware tag
> 2: backend update firmware tag
> 3: backend update firmware tag with unipro
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

From doesn't match Signed-off-by line.

The patch is corrupted and doesn't apply.  Read the two paragraphs of
Documentation/process/email-clients.rst.

This is a usespace program so I don't think it has a strscpy()
function.  How did you compile this?

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

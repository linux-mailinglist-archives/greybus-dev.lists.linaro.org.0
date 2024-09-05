Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D619896CE4C
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2024 07:03:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DF15F44036
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2024 05:03:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	by lists.linaro.org (Postfix) with ESMTPS id CBBD3434DB
	for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2024 05:03:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=wAciQtPN;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.53 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3770320574aso148842f8f.2
        for <greybus-dev@lists.linaro.org>; Wed, 04 Sep 2024 22:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725512614; x=1726117414; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bE55jMswc3Kd1NA0WA3GkeMdZvR+oa4ium/onUMNrhg=;
        b=wAciQtPNV+uns1JEiUuyvQjII/i80f0h0AzH4kUFSiizu8sGatuv1gomwcfCuXpoaV
         UHw5TJmVVSsr8odZqu0GjEpAhx/2KGXwlwfV9wxPqnw7szgD2aoCZoRwVfsWrChHld4m
         DGHCnMrpIDSDP35p6w6FlVu1rDcAHuYu/BfSiBjuirRMOTZdnC+tkthGeSf8vX4jTMjP
         QeI+WZmt4MyGRyJD7GA/0P3MmaFHbaSDZU1PwUBgmWSG5jyl6YUhW2Cm3gKJXpIvpWrm
         LPr9rBjOjFw6M9GB3uFMj3ZQIDbjX0PsiDiXe9ASn63E5xEXpOJxNNy0OKHW0EbkdKI8
         31Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725512614; x=1726117414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bE55jMswc3Kd1NA0WA3GkeMdZvR+oa4ium/onUMNrhg=;
        b=vDWsPZHSqeUhBIh9K/MroOBoSC/GVjAD1WRg9fNJnxfNaaBMB+XdweQDY18/FilWcy
         0NAW2lmnrmpCmhrnz/0P7NgtP8ZeBEvrwF8i38Gc+TQh0BKMEzXrYuPvLRDoGN9X0fwm
         cUHvaUKff/Si/HzSnXPQvi65mhU9T4CtLi2sU8dfqVfOKSyetUfsY+Tp+DV+tVArz9cL
         IwEaS57ulZTAed+y7QCsFIZGDX1Lv5yn+SDN6zaGUAcHcwAM5UhZHQLvRsp/iytN2t04
         nyA9JYgw6LE2afa9oc7q6ZYNRjMWJJF8qu+DfRXCq9oJWy1nV2CAEfe0gF6GBTLTX5no
         8FeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYPtNX0T17N3JOcSWVFq35jWkvLtXaQihdhwX5NCIji81q3okEDnaP8a/81VQJlfjTf1JyudfEtoOY1g==@lists.linaro.org
X-Gm-Message-State: AOJu0YyICJw78WnMsCMGGpEZJhLT5gs99anDf7WJGrPBwowOSAIgdMn4
	EiZ11uTKCiYS/RNqHn5BNVAsLyDK7iezha5v2t/B7gnO214Msg3b0xDrqwPmS0WMUw==
X-Google-Smtp-Source: AGHT+IGnht06+6EQRhWaBO3mAk2qqMwD7GrR/KXBQuajQbXlnpSMcTpVnd4FM3JnmruyXAF2Q1Cdig==
X-Received: by 2002:adf:f10f:0:b0:374:c9dd:2b15 with SMTP id ffacd0b85a97d-374c9dd2b64mr7705962f8f.31.1725512613496;
        Wed, 04 Sep 2024 22:03:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb37efsm18421565f8f.109.2024.09.04.22.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 22:03:32 -0700 (PDT)
Date: Thu, 5 Sep 2024 08:03:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sayyad Abid <sayyad.abid16@gmail.com>
Message-ID: <3fc7ea0e-82e1-4df7-bada-b8cb1e11a0d4@stanley.mountain>
References: <20240905015714.356662-1-sayyad.abid16@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240905015714.356662-1-sayyad.abid16@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Bar: /
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: CBBD3434DB
X-Spamd-Result: default: False [-0.08 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	BAYES_HAM(-0.58)[81.49%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.53:from];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: O6JDBMRRXEBTGZSNQCKPDUOP6LGLPMEC
X-Message-ID-Hash: O6JDBMRRXEBTGZSNQCKPDUOP6LGLPMEC
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Fix coding style and syntax issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O6JDBMRRXEBTGZSNQCKPDUOP6LGLPMEC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 05, 2024 at 07:27:15AM +0530, Sayyad Abid wrote:
> fix errors from running scripts/checkpatch.pl, including:
> - Added spaces before open braces and parentheses where required.
> - Resolved macro argument precedence issues by adding parentheses.
> - Corrected trailing whitespace and improper indentation.

This breaks the build.

Plus it's too many changes at once.

regards,
dan carpenter


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

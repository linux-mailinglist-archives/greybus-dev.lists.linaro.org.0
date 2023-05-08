Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4016FBBA9
	for <lists+greybus-dev@lfdr.de>; Tue,  9 May 2023 01:55:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D2E493E9D4
	for <lists+greybus-dev@lfdr.de>; Mon,  8 May 2023 23:55:56 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	by lists.linaro.org (Postfix) with ESMTPS id 22C033E9D4
	for <greybus-dev@lists.linaro.org>; Mon,  8 May 2023 23:55:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=eDmEQkTI;
	spf=pass (lists.linaro.org: domain of htejun@gmail.com designates 209.85.215.175 as permitted sender) smtp.mailfrom=htejun@gmail.com;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=kernel.org (policy=none)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-52c759b7d45so4722325a12.3
        for <greybus-dev@lists.linaro.org>; Mon, 08 May 2023 16:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683590152; x=1686182152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2YJeCVahMakSFFIeHkE0L5vaAYWzeS9qst+vBo++bi0=;
        b=eDmEQkTIIHMRWU2ntPglrb0g3MKZDF4Lz5fmmHbtX87ohKxjyU6xPw0WkmwtQ5Dmot
         uGL20P5UfpNoi+/vrdkkAczY+r3cNJfPIkEqvbGHQ0HhU1SYD9fJRMPO5DnJa7fGCFxQ
         oPv6i/8RjMJPNQMo1Dm/gF/Q0fwa9VYP2suNlp8qLe0do4nPZpTiBZSd0RsBCF39SeKh
         S0g3hygvbANJn5pD5CVuiu3dl4TTdcV2J93xNyKC0vnWjbFIByCpR7bBr/VRW09a7bDe
         bfoN61mfw84Y3mWoiCCLmAppkvcrEAEVDrJ4OrvIlHxr9G+Gnbq7917NUNBiLpd2meIm
         Lhzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683590152; x=1686182152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YJeCVahMakSFFIeHkE0L5vaAYWzeS9qst+vBo++bi0=;
        b=WfMFrC+SmKkY10eQJXaTUiVS+cpstScV52RzOb0oWhmi0hjkF3jdq4QYQ05q8rWV1T
         XvfaUG4epxs86pZwtENJuzTZ0l+x0AbobMqXSzGrTiL9t2UcUTjwVtLBbpJ3Mo5ZOXG9
         s6ofvv3emO5VxQqHTQemiZDEgbQG3e2ttnUp0BeK03byCtvqO071SRs5d4H2k6a3i1r2
         cimPXghqaFexcYRrkcoupOAg3c/gEny8+0U4W00qbr/R0FMybM28RS/DcuoylkIR2hKV
         y97M5RxzkgMIocm7UHXSWvom01dQfqpM0/Xm/uGG0JaMSqUJTp0nIF6ZNzSHIzLNutTf
         kXXA==
X-Gm-Message-State: AC+VfDx2naDL3YxDRdCWsB+VGqmsMrInOag/19Vrsn5OVaDfD1wqPZYQ
	2VJiGIHHLVjiu7npHf0AJfo=
X-Google-Smtp-Source: ACHHUZ7uPD3bqVE30fL2j9i8d5ZClVd6/6A8t67rGZjmf/al2IN17DxPUOk+QF1xgTZAd79abA8e4w==
X-Received: by 2002:a05:6a20:3d20:b0:100:377b:2753 with SMTP id y32-20020a056a203d2000b00100377b2753mr7867297pzi.14.1683590151987;
        Mon, 08 May 2023 16:55:51 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-a7fa-157f-969a-4cde.res6.spectrum.com. [2603:800c:1a02:1bae:a7fa:157f:969a:4cde])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79251000000b00637b0c719c5sm454513pfp.201.2023.05.08.16.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 16:55:51 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 8 May 2023 13:55:50 -1000
From: Tejun Heo <tj@kernel.org>
To: jiangshanlai@gmail.com
Message-ID: <ZFmMBq6Gsc-pWrDS@slm.duckdns.org>
References: <20230421025046.4008499-1-tj@kernel.org>
 <20230421025046.4008499-3-tj@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421025046.4008499-3-tj@kernel.org>
X-Spamd-Result: default: False [-3.53 / 15.00];
	BAYES_HAM(-1.43)[91.15%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.215.175:from,2603:800c:1a02:1bae:a7fa:157f:969a:4cde:received];
	FORGED_SENDER(0.30)[tj@kernel.org,htejun@gmail.com];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[kernel.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.215.175:from];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[tj@kernel.org,htejun@gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 22C033E9D4
X-Spamd-Bar: ---
Message-ID-Hash: 6OYHBY4AIE53DF442LK4KJDJYFN5JPLP
X-Message-ID-Hash: 6OYHBY4AIE53DF442LK4KJDJYFN5JPLP
X-MailFrom: htejun@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, kernel-team@meta.com, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 02/22] greybus: Use alloc_ordered_workqueue() to create ordered workqueues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6OYHBY4AIE53DF442LK4KJDJYFN5JPLP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Applied to wq/for-6.5-cleanup-ordered.

Thanks.

-- 
tejun
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

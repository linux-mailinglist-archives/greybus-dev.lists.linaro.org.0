Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKfEHH/8tmnvLAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 19:37:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F10FA291F29
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 19:37:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 02ADF3F75D
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Mar 2026 18:37:50 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	by lists.linaro.org (Postfix) with ESMTPS id 4D3FA3F70C
	for <greybus-dev@lists.linaro.org>; Sun, 15 Mar 2026 17:45:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=TMcCuGqL;
	spf=pass (lists.linaro.org: domain of ethantidmore06@gmail.com designates 209.85.128.177 as permitted sender) smtp.mailfrom=ethantidmore06@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79860421382so33524047b3.0
        for <greybus-dev@lists.linaro.org>; Sun, 15 Mar 2026 10:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773596722; x=1774201522; darn=lists.linaro.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezreWzcg646xLd13w0mmXtM8mU/LA4H5PXlJX4hzNuc=;
        b=TMcCuGqL8XO8oohSRjwJfNTKnZFr0dDf9UBobbPxw9EUjcQCEQzGllTA8tv1nSjWUW
         TlgLqWhTX/5SQAAemJTqMgLgzo0HwGVf9fhX67SRcl3lwU4LcOpRLxcuKDPl7ommqdiP
         LGWZGM0MOW0kC6G3WRWvjHqIMnCm7Ge+xgiIfO4Ed0xJU7nWlB/iKi++ujdNDIydY6ZG
         pmUesq0kPfN9XE2nQC44cg9qoTijFISZNuRJHwPUw8UeSb4w5VjWdzHMFTuE+Fh/meo8
         Wvn3xIMhumGs8Jild65L4SwyFJXZ0tYyLUj63y3gWIgU7ajY02bMRa5HB6XalCMTSIdL
         Pr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773596722; x=1774201522;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ezreWzcg646xLd13w0mmXtM8mU/LA4H5PXlJX4hzNuc=;
        b=ZN9bW3LY58PIux+SuihWz4677E+9kIAtUPS+84cwJPnU5TcSClKfYdWvcNM7Lbql82
         uguzmi14YedOsBSy6GA9rsNBgHtfBJKxzXd2Q31rvmZ7qGiwfGcttvfHFj2uFxYvX6DV
         sTThxZqyr6QjFjbjtUAuhaNHCCVP70kI/4FgOnVMVR2tRSO1COBKl9u4P6jN1GhkewFD
         jaoAFl/doJvmwRyf/QIhw9iroH1fOZElrjb09qHffFmv9LNCkfu4o1E8SgdO8Vpkh3V5
         CchLbnEfNurkCCw/0R0PYrJN6j43k1/1tUfDvy1L9TFx4cxJDtkxMlgZ0kB69JpwZFMT
         HIFA==
X-Gm-Message-State: AOJu0Yyz19gvhIoKPJb1WWn42h9WV5gF43E0qyeWYlYhxWPdRR/syWzM
	gy6U8t9hRqT1GjdBO6FQYZUptHSfE826uR8XtAlMzDUxvV0qRq9lJ4hv
X-Gm-Gg: ATEYQzxPv2Bs8eSAM9GtpBFMDknDWzzhyaqH+5F37gP4VAhFl7Qc/RxbceNKf50WjPZ
	B66x5M7cWdNvUvxS/dQ3CPbfQy9bSQX/ab20WIITsvkIEJVib0Qrx+SGaI9S3PNUwlxdFBtFIAp
	MeV0miswlYyVRj4rR5vzzr+mz8F4qT1SERm8VIAEK3691bWFDl/CZGzfVfBnbhxlggJowC5FQHe
	0bHMyX00zTFrgMXUiPl8NP3EQ8c+ugZIO7EfRyk7UfWz1FOEyK86iJyBJ2THFfFzZrNPIqTsy1K
	66sK8Z99lA72Byc5gAWsnpp9k9FzRiKlF08/Q7mQale9Ehssknn4SgbYZ6AAiLMypAorXd5P0f3
	JKTHZe4fCDSZqy+onvOIhg3/vhgwHGwzEifdv1Ix9D3NSpRS1yz0ZeE1URUGDj+o5uDmODgGOlc
	/kVF2HGimWwTNO6hpeFBjscTym0StDqUUlGmoQSuXkEpgIkmlkbTs836o2uu/0j2bEBfU3x3kz0
	8ZVhL4+V2mCWA4d0WMBSR6Jz1w6DSGj
X-Received: by 2002:a05:690c:6d84:b0:79a:40fb:933f with SMTP id 00721157ae682-79a40fb9bb9mr29261127b3.51.1773596721682;
        Sun, 15 Mar 2026 10:45:21 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:4c00::5585])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917deb69asm75154027b3.10.2026.03.15.10.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 10:45:21 -0700 (PDT)
Mime-Version: 1.0
Date: Sun, 15 Mar 2026 12:45:01 -0500
Message-Id: <DH3JK4H34XH8.2MG43DU6UAQDK@gmail.com>
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Tomasz Unger" <tomasz.unger@yahoo.pl>, "Viresh Kumar"
 <vireshk@kernel.org>, "Johan Hovold" <johan@kernel.org>, "Alex Elder"
 <elder@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260315-greybus-pe-format-v1-1-d923fbed3097.ref@yahoo.pl>
 <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>
In-Reply-To: <20260315-greybus-pe-format-v1-1-d923fbed3097@yahoo.pl>
X-Spamd-Bar: -
X-MailFrom: ethantidmore06@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LGIKY3DYBVKR4WCYPPVJKRC6GYOL5WJ7
X-Message-ID-Hash: LGIKY3DYBVKR4WCYPPVJKRC6GYOL5WJ7
X-Mailman-Approved-At: Sun, 15 Mar 2026 18:37:49 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: use %pe to print PTR_ERR in fw-core.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LGIKY3DYBVKR4WCYPPVJKRC6GYOL5WJ7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[yahoo.pl,kernel.org,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.765];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: F10FA291F29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun Mar 15, 2026 at 3:40 AM CDT, Tomasz Unger wrote:
> Replace PTR_ERR() with %pe format specifier which directly prints
> the error pointer in a human readable way, making the code cleaner
> and more idiomatic.
>
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

LGTM.

Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>

Thanks,

ET
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

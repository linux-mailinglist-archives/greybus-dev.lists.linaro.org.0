Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +M72CirynmnoXwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 13:59:22 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BC0197B85
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 13:59:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11707404B6
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 12:59:21 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id D1D15401F0
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 11:32:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=IwBE5B+4;
	spf=pass (lists.linaro.org: domain of azpijr@gmail.com designates 209.85.128.42 as permitted sender) smtp.mailfrom=azpijr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so72299765e9.1
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 03:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772019123; x=1772623923; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3HrSb4kQr0tZEAn4+ziXjCV7QcBIfNfDbAbmUqHzK0=;
        b=IwBE5B+4boRngwsOTjRtTwIdC4bgFEdlNSlZLYA1nfeAf8XMMCfCSnSxCTvRzpMWxd
         SAaNSguM7WMwtFVYl2JvqcXk7zO7MszeV/51rsk5dHxgZdqzoEPky27ZVSBL3xH/mRWW
         /FB+8RN0G+EBWHEDUR1V/MwG5tcxP9dI0AD3BELm4cejeU8+MxjeY60JXkrj9MS5SDoo
         4GeCsGU3Hf3XQGl379SUx217DpsDoF29k26fguBuoh5sZlZ5+jfaZT5L9BYQH6ZW5yXR
         xAubHfeMuueMfcTem5Se1r+yjXpie0OTIEN/H5HEuadhoMIwiLPr27keUq1WrBHoy/e9
         tjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019123; x=1772623923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3HrSb4kQr0tZEAn4+ziXjCV7QcBIfNfDbAbmUqHzK0=;
        b=CJaSVHezBHr9pxgPPslMYqXs/st8AbtSj5qAHyBDihvuE5UmZqSzt4JSIJMwknyhLf
         guQ7fBHGkjh+cy0E9LiBZbl2fCOwDQnMttQM6elJFp9gz8R2N7T7KoSS+Xr/yBMJvATc
         9jsrQsv3VMPKvnXuAB6dn1SAz67DO5jcz5dIb6XoLr6z57sJlh3EcorcgZoXKlqR+wRK
         23cOvgkDesfzn7IB9ZUDM7ZUvFq8kL96H7Go0QPPc8ynTsNUQ8U4cSSt8dIELWhT+Iwc
         gLB3tZFlKeO2rGkUHilDCavWE0O63F2lF+PbRGq41pW3J/VCHmib283+ORGpr/9RkHHO
         joDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwYMVu3+cDOHvVTLTvvgt2e+dA2DHz4GAdNLPIG1KuzJmNvF9CWkieJJ8K8WBbAF8qThKNalF5/5iHPg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxCk1/7A+bYGvq80I+R20n/I02dJI0NOxdHDA7FDk/cv+aJQA8v
	zKhax6gpJF86yUQUuq0QTaAAZUQJkCe/dcQtYeoKKI/mYIogOWEYss+p
X-Gm-Gg: ATEYQzwO/BFW7JsCEE3kOZUB98S3HuzN9hyqEmjQAaF5t0yzg4QWchaUugqhZp/GiH9
	FHKsRUpdJd/R+mxxQ1jNHArT6ydGoP6d5vKi18zMVnY4CuL75PBgYVAFg2WnuvZr4MXTmHjCiBe
	5W7OVUrFO3JT3dmziS+vEg+m82VyZGPrK16VaPcivWDuC0b6gqMxBK8BCsd3MdqkyvG70wHukC4
	9BxC+7qhgvEQz3jqx/ZojUnK1hKZ8u6h2YqtyZtYQVA/kw9DaB3MERobEIBEZJFvN9+wzaaIT6u
	XV/H/guouHe4F46Wda7BQbC4iP8sibKNAbmEspWYJTPs1ZsmdxOpVzhOlkhW2d9D1CJcQxWmQYT
	hdvBV8XTlbfgG9wMYkgI75zdqkC65Q2vkUYQjW2tpzemlhLRO9uaNp1wSZq/pu7qt9yEBmKhpn7
	joD7sCLRe+PcuPuKQhXRf5kyAwv/GCrM5Z3VpianM=
X-Received: by 2002:a05:600c:45cc:b0:483:6f37:1b33 with SMTP id 5b1f17b1804b1-483a95f5892mr250171385e9.30.1772019122561;
        Wed, 25 Feb 2026 03:32:02 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm13739805e9.5.2026.02.25.03.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:32:01 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: dan.carpenter@linaro.org
Date: Wed, 25 Feb 2026 12:31:47 +0100
Message-ID: <20260225113150.109829-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DAN_CARPENTERS_MESSAGE_ID>
References: <DAN_CARPENTERS_MESSAGE_ID>
MIME-Version: 1.0
X-Spamd-Bar: /
X-MailFrom: azpijr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DVE5BM3MFURL3SF5WKKRS5OCTPA6EPPB
X-Message-ID-Hash: DVE5BM3MFURL3SF5WKKRS5OCTPA6EPPB
X-Mailman-Approved-At: Wed, 25 Feb 2026 12:59:02 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, azpijr@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: camera: add comment for mutex
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DVE5BM3MFURL3SF5WKKRS5OCTPA6EPPB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 00BC0197B85
X-Rspamd-Action: no action

Thank you for the honest feedback. I'm a new contributor and I was
trying to resolve the checkpatch.pl CHECKs to get familiar with the
process, but I see now that vague documentation can be worse than none
at all.

I'll withdraw this patch. Since I'm looking to make my first meaningful
contribution to staging, do you have any suggestions on what types of
issues in Greybus are actually helpful for a beginner to tackle?

regards, jose
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

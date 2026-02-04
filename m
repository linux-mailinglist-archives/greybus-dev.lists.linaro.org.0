Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK7iASsUg2nihQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 10:40:59 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA7E3F8D
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 10:40:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6C0523F952
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 09:40:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	by lists.linaro.org (Postfix) with ESMTPS id 202EF3F7B2
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 09:40:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=VM6jU1J3;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.54 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee0291921so62608855e9.3
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 01:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770198053; x=1770802853; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPonf3AZtatUeCCGzcTzVkMI7OKDgDP2ONlb8EW8HRk=;
        b=VM6jU1J3cpK5NeDTC5Q3aAFccfR/Dko8dfJPgWCDjU3S64i2jR6W9QER1aDyBvClZR
         n+VnhEq+SygbmJQWLSud8KeB7g/0ITSnYkigOFL7tgPHBMxtmILqMQHScIyPIt04pyMT
         vwnMQ7spf/TTEkdoM1wJ0BeaOd/4BanahiLIrvQ+jF/KOss2d73b3l3bQSYHo4+D64wo
         KM0mWUkn6DTeeEDLbOvvlCgo3ReRbJLy3eIY6VbZrP+/0inMYs0i0tQFjKVvxjUdSebj
         +zBeJH5vUT0OGrlMhkp2xFyg77XjoZi/R1iHU4whMu8FDWoBUyIH+bb9ssImWimC/t/f
         BCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198053; x=1770802853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPonf3AZtatUeCCGzcTzVkMI7OKDgDP2ONlb8EW8HRk=;
        b=aCiyaAIk0V1V0yu/aJF8OxEuLUup2JQDsuRChySixnE/+c3EDUYTVYLz//nZdmoAKB
         BWUVweD3KrGQBwxs9Bpqzsx4dzKpNzI3KQ7AimWJ1mrVQp2optxy829k+JGGQ72Qzi8V
         3wNJwjuSJ90C0nM6OJTGyUVZhvTecVC/Mkk44E/sEKt8KScPqmKqKMnF5Js1dKPRe1EQ
         aiM4jpQWqVNxhQ7ExZ6PFH5/bpP4pfve3aS7ARMnZLwFkcEtTLTRYoHkaWbBr8cbJfOY
         AbcEnleLPNryqajpk+mHH0Vbkv98Sp67FGUpDIxwdYB3RbyCZ/yysXG3tm7JBUfWsdpa
         A5qQ==
X-Gm-Message-State: AOJu0Yzj+OTxwHpawfWxoI4DxlHLpPS6aDA+RjHxnOpnfeM6MqsO/wL4
	A8ca9CT25qJlbKvQYYS1wkFlGV3WQzdQTVmpZZHIpiiExL+BgrtdPDSVlp2MlxfqY7q4Xw==
X-Gm-Gg: AZuq6aK23ji+8YABbLT0ShWHkolWZ0utmawlTNVP4COj2n6v+c0shTy/lOvn9NiOdhn
	twX4/j9RIYqgtG8MBtVUcYpPVW7QJLRspULqVe06M2+AULrNVwbHVsxD7+gm13X8TSKiI0eYcaj
	sYS0Wz2E1yZ4gkR2Cro7XTOoxojr5a+6k1cYnZPPIFPKwFDwru+QwcaVibz5EnesPw76YqRXQxV
	p5nSpnPWASpZlL68UnGz6YkUwnK9ZTB0MaFszuzw9sonim548zrPIgukZhLBdghzKUMCLIw4x0g
	EqT3jOe33LeVCVcbUKjbocEmPShys4h1KbAFcvX183fHEPCtQDHrWx4lLZExBtl38ANOKK7OrMu
	TgvtG9yIPDackOwhym/wRT0wyTdthLxu7UWngR48ELfsNnr4zNzxsSNQ8XWGw+pSO+v9xQ3bjgL
	15p8t5nPP4TB945UC9
X-Received: by 2002:a05:600c:3acd:b0:47f:1a8d:4f30 with SMTP id 5b1f17b1804b1-4830e972198mr30099105e9.26.1770198053051;
        Wed, 04 Feb 2026 01:40:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48310919211sm46050275e9.11.2026.02.04.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:40:52 -0800 (PST)
Date: Wed, 4 Feb 2026 12:40:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rachit Dhar <rchtdhr@gmail.com>
Message-ID: <aYMUIUr2g8JqaaBK@stanley.mountain>
References: <20260203123209.182175-1-rchtdhr@gmail.com>
 <CAJH1ELDtpYQvrG_Rd8-XtTk6Or5yDT_nT3dT_s8UGg-mpnAwWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJH1ELDtpYQvrG_Rd8-XtTk6Or5yDT_nT3dT_s8UGg-mpnAwWQ@mail.gmail.com>
X-Spamd-Bar: ---
Message-ID-Hash: PW2ADJ6OG7327SQWK44F76KGPLZMVVQQ
X-Message-ID-Hash: PW2ADJ6OG7327SQWK44F76KGPLZMVVQQ
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: Fwd: [PATCH v2 1/4] staging: greybus: added comment to mutex declaration in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PW2ADJ6OG7327SQWK44F76KGPLZMVVQQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	NEURAL_SPAM(0.00)[0.995];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,linaro.org:email]
X-Rspamd-Queue-Id: 6ADA7E3F8D
X-Rspamd-Action: no action

These forwarded patches are corrupted and can't be applied.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

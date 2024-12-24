Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1B9FBF6D
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Dec 2024 16:07:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 03753445C7
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Dec 2024 15:06:56 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	by lists.linaro.org (Postfix) with ESMTPS id 015B63F32D
	for <greybus-dev@lists.linaro.org>; Tue, 24 Dec 2024 05:19:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="Je/hMEwc";
	spf=pass (lists.linaro.org: domain of evepolonium@gmail.com designates 209.85.216.41 as permitted sender) smtp.mailfrom=evepolonium@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so4130952a91.0
        for <greybus-dev@lists.linaro.org>; Mon, 23 Dec 2024 21:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735017565; x=1735622365; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvqMX5vTidA0r0PT5vyvl95UbhSddWRNtrjhBOqE2g0=;
        b=Je/hMEwcrZKF7aPdpQb6pzCOmLGcQdoz4LrOHjUsn61hkZd+78U4WKHjdb548DOS/C
         YVhCgobZFf21a+bgiQhzDVYinJR/CaHPDZeTbv3Hj5jSLyo/PF6xn4ZYQIdkNc7+1MpA
         YDl9Qmd9TSTbhxNZH4EEQk5ofD6wyzI5kI+Vze+sdrhqgJs9UaIB9tawhB3gtTtEzj45
         51aIMDE5Ar37WQAFCSEXJj/FU8OxPt/qeyrADYDC3wjGkAHi/wqcMonU5r7F+ftPE+9P
         WtXBaxydNZ1m8rNCc3t3o1DkpR6O1+z/ETu5WX753tfenxyMKox2EySA18E4V0arGfzt
         u2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735017565; x=1735622365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvqMX5vTidA0r0PT5vyvl95UbhSddWRNtrjhBOqE2g0=;
        b=E8J9dofDiYNtjSzDlxrvmdT8pwayeqdhqyOPeQrZUK1oVVsgTfrcEt5EKdao8ufdjP
         Tp/UogIWqEWD+W+EwSS9gTQ/MF+2VEH6ybeLMoXkIJgbBkPIk0BJWnj14HUKpn6UY4DM
         vEu2/cyHw/sd6vGIVauFbR94BDaXmtzwEKs+IhgcUNhbdw/Dp2yEJ1F75HV4q1uWEaSf
         acJjh2uQpkYIyGe91nUYcdMo23QdeQU0WHS6zmPWqgevtLSR28jbcIa0qE4uLyl5HbIG
         1EJwNBYHLwwOizD+MKNKDPUMoHv6DlqYJZrdb6YfQnok6LnzN9VBgn1m8JC78l+2Eq7N
         wzqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMdO5KjNXyDASj9eoUBnD+4i/LTfmC6WtMC5QjZcCuOqsdJcCAiyikXAxgrZXwgdeHFX6sEhWLH32cuw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yyr63b9nUrJtM8WoRxXD8w1UF64zk0gGVHuxnDLUtCft0RYyPJg
	ER/gcH2dTIA4KE3nSIlCpJGsleJxoKlQ7co00168038vlENtp/b8
X-Gm-Gg: ASbGncuDrRwtoVkYtcJ+chTU4nAnYNPrnk3wLWuCCw3D7x/ypzWkZBGbWoMOVQSkLRp
	5lAQndhxpZkkZjyursul6REb3+gwe0ZqbfwV+T8fpVaEdpBZx1fiHEEKNccsOwqamm9oapZHJ/2
	UDxqRIzBGm6TpEifQWUJjxggf+zWofLMg7NxMk3up/DN4+BEoxGqncKXyDp+mlyGVHyZG0dLuqm
	M4pxD1RA7Wy6Ig4lIyiGB0eiMJC2VOUyARhjIB2QYIXIlHXxet9dFgc9SSENcvgbHhQ9ZHCEw==
X-Google-Smtp-Source: AGHT+IG2t2HpVyZOO0iUJzYs8b8yo+wFxdVO/z2ldSJ9Fcjw9+djqM2xvShshxLjXt4t7GicBeuR1A==
X-Received: by 2002:a17:90b:1346:b0:2ee:ba0c:1726 with SMTP id 98e67ed59e1d1-2f452eeb5c8mr20192393a91.34.1735017565049;
        Mon, 23 Dec 2024 21:19:25 -0800 (PST)
Received: from localhost.localdomain ([106.208.149.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5046sm82343955ad.179.2024.12.23.21.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 21:19:24 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: gregkh@linuxfoundation.org
Date: Tue, 24 Dec 2024 10:49:17 +0530
Message-Id: <20241224051917.1971-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <2024122358-vexingly-broadly-7df7@gregkh>
References: <2024122358-vexingly-broadly-7df7@gregkh>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 015B63F32D
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.32 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-2.22)[96.29%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.41:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,vger.kernel.org,lists.linux.dev,animalcreek.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.216.41:from];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[]
X-MailFrom: evepolonium@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZRMAP3CONTV2OYUGH4EQ2OJOYS24GNVY
X-Message-ID-Hash: ZRMAP3CONTV2OYUGH4EQ2OJOYS24GNVY
X-Mailman-Approved-At: Tue, 24 Dec 2024 15:06:51 +0000
CC: elder@kernel.org, evepolonium@gmail.com, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Remove Module from list before freeing in gb_audio_module_release
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZRMAP3CONTV2OYUGH4EQ2OJOYS24GNVY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Yes I have tested the patch with greybus drivers enabled on Debian 12.It works as expected, and i did not get any errors or warning during the compilation

Please let me know if further changes are required.

Best regards,
Atharva Tiwari
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

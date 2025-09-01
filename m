Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E7779B3E38B
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Sep 2025 14:44:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BEE52444B4
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Sep 2025 12:44:31 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by lists.linaro.org (Postfix) with ESMTPS id 2AB94444B4
	for <greybus-dev@lists.linaro.org>; Mon,  1 Sep 2025 12:42:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=dQVm3gMr;
	spf=pass (lists.linaro.org: domain of nogunix@gmail.com designates 209.85.216.45 as permitted sender) smtp.mailfrom=nogunix@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-329b97a143bso40536a91.2
        for <greybus-dev@lists.linaro.org>; Mon, 01 Sep 2025 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756730528; x=1757335328; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOY5Dw0yIneTkFl1rkItoGut8jnz7U2o1MHv+e5ti3A=;
        b=dQVm3gMr0nBxJwkh8ilX96H0oipFlKveifEZAJZqoYmg9QziSjrR/dwCVKC65YlkxZ
         +GNS6nC5hhCupYm3aCGvYU6QbBcfLPZ6RgxPwFTEghF/0xTFg7C8pAZtEml4t+cII3cm
         1Ku4PjvQ9zAMxvAcutkxg4/J5LQmxMvOiTWvfZgnZS+XOKBVCFJhae8PICjBgZ7Xif/7
         CVOEq0uPk5FPdG8/gHhrayoMdn1ltUdoVJZIY0sL7tEmV1biTAdo5EOpq++ocWBu3ddb
         aLbvbvMRMYzueMuMfhXygA5RreRfar8NBpjlwBMIArv8NDxqHiVAnnmRGe2IQlMs6/dT
         7naQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730528; x=1757335328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOY5Dw0yIneTkFl1rkItoGut8jnz7U2o1MHv+e5ti3A=;
        b=c0cHucYTAKQXJeZ1MGwOf2mOytMuZHO1M4s04nrkD2MN/BmhxFxWI/ooFOgdShf+kI
         ywK1MtwK/CVAqrI99XugLacvADdDIey+SaGX2fkLLVlMxzvsETSBcLwoL/EfF8kaQgJp
         zghQxfGYTU+W7Y7S2WzdPHbOCvhMnVsyqJVvoO3FpwhFL3Qd+Ji25Dy0goj7rBWNpGj4
         174hB6bKs6cYl/YuFp779EWdDp503x5B/RiLClW6eSG1xN1GBWWzdVyYC+fC2S8jEpge
         KoEqL4iCYNiWk+2ruxlN1cXjlAFJZWfbpzDqZv/SZRL4wWYTedMc3nC6p1w9BFXAa8Vn
         BYmg==
X-Forwarded-Encrypted: i=1; AJvYcCWSiF6Vpp4vxp8FL+5IBB8ypQuIg7cQsXQvBdbf3vP3Aiy01aYts5ZeKtM8bAv8/ItHOSTiI24/qAHDNQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx3Dc/j/MbrGdMFYcrfeuAbZKYVEMw4sxMWweU7SSa9RXfvQirI
	pcQPKRNIr9HJV9mLpw9WUm6bGP4rSanhLMYpxrLYpTrrKD+/HhXha5n7
X-Gm-Gg: ASbGncvPmCmr50Gyf0BOVSHBmbGDiRUR6KQFQirljMXGCSNTSlLQARFuP6s5Nz6amyl
	vegtdbrYFAefoN/qLoh4e7mAH86nCYQlCEN2HZXClkyi4pqG10gm0a7jeGDhBJ0U4KNTYgTi5JE
	rRU8FXaUdav23wRRUoi4URkH8Cs1zNJGjY0FRki3GgegZ4X/wZYbxm3dw7OWzlou5z4wVwgDFpn
	FlOM3jePkXF3vqyMF/Nc5uPfDhsLljw5IqLmEcnMWQHZrUVV7kgDV/0n+XyS6Km7gvyysT6c/nQ
	Wzbvg7PdvBkPUpBhQJ3IhaLSef/SBX1NPLmG3FDK1OidJzwAEnGa1gFi3eFDaX8eOnZY9rPDp1X
	uM6mQPZ3xruL2eaxh
X-Google-Smtp-Source: AGHT+IHUn0SC6xICje1UUoFTPSuAjVvF3tBb8TKjXdcRcJR9Br1XsPEsEJrd5UjL8hvq4o4e6MFvaA==
X-Received: by 2002:a17:90b:4c4a:b0:327:e781:3d37 with SMTP id 98e67ed59e1d1-327f5be1809mr8219063a91.6.1756730528211;
        Mon, 01 Sep 2025 05:42:08 -0700 (PDT)
Received: from fedora ([2400:4050:d860:9700:8e8a:52de:86af:cfe3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce0c5dsm16686640a91.21.2025.09.01.05.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:42:07 -0700 (PDT)
Date: Mon, 1 Sep 2025 21:42:00 +0900
From: Masaharu Noguchi <nogunix@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Message-ID: <aLWUmF2fDUyerjps@fedora>
References: <20250830173850.323897-1-nogunix@gmail.com>
 <20250830173850.323897-2-nogunix@gmail.com>
 <aLWEm2sQpmoNYLAC@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aLWEm2sQpmoNYLAC@stanley.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2AB94444B4
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.77 / 15.00];
	BAYES_HAM(-2.67)[98.55%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.45:from];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,gmail.com,animalcreek.com,kernel.org,lists.linaro.org,broadcom.com,raspberrypi.com,ideasonboard.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2400:4050:d860:9700:8e8a:52de:86af:cfe3:received,209.85.216.45:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-MailFrom: nogunix@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JX42YFLNMI37ZWWLI6SEYWYIVRKK5SZU
X-Message-ID-Hash: JX42YFLNMI37ZWWLI6SEYWYIVRKK5SZU
X-Mailman-Approved-At: Mon, 01 Sep 2025 12:44:26 +0000
CC: linux-staging@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com, hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: audio_topology: avoid -Wformat-truncation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JX42YFLNMI37ZWWLI6SEYWYIVRKK5SZU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks for the detailed explanation. I understand your point regarding W=1 warnings and string truncation.
Based on this, I will drop the previous patch and leave the code as is.

Best regards,
Masaharu Noguchi
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

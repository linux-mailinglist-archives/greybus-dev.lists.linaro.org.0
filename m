Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 52577B3D05C
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 02:50:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 33AA145D58
	for <lists+greybus-dev@lfdr.de>; Sun, 31 Aug 2025 00:50:43 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id 49882410E9
	for <greybus-dev@lists.linaro.org>; Sat, 30 Aug 2025 17:39:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="gBm/5cs/";
	spf=pass (lists.linaro.org: domain of nogunix@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=nogunix@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24498e93b8fso4204925ad.3
        for <greybus-dev@lists.linaro.org>; Sat, 30 Aug 2025 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575540; x=1757180340; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pd3QAgaI6xLn3TSraR7jO04+lJz847xBQQfmdUU8S+4=;
        b=gBm/5cs/3Li2udup5ltKChoCsa29Quz1mbKyQfPLNRYDoASD8QzQq9w66cDBU3CZM6
         EsE61MdLH2nUk501Yu+glqXIwEMsERJy6xgTseNwhTPsUIAsU0QqHUmxD7G/h8kKW60G
         MA/pLgHN4+eLwXtdyRFOwgxfOg9UIhvt/IF0F1/P6SjLKK/j/jUN2mPu6lg1zXVVNwle
         AWBCX9lQDXQq9taMt5vzoJPyJ1CISnXCaLmsDmdHHy2GoaiwXvedDW64O9GMTB+AOwPS
         WCODmNr/WU5sb9J+Ryqz4b3Ds2aGR3PDjgCyAYrtlE1Yn/lD0YZapZMo+R1mGunqxBJY
         ERQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575540; x=1757180340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pd3QAgaI6xLn3TSraR7jO04+lJz847xBQQfmdUU8S+4=;
        b=q7hBtqcV8CO+ir+Gf42LBsVlGb/UCEYmvbqbI4/ROdS9dwx4Ayd1m8rwOPobG6uYcA
         v0h38D5eZpb4onybAErFMyBy7f9K3yGsOX7d6Aorl4kqTNNl3PPBnulTQf+xQIFwT7lm
         Kp8gNB0UaNg6HlwyeisRmU9jlhWrdEMSilbV7oojujlWBLfooHDUEld5WztLrbHuvP77
         A71nA9ljgns/eXYGyKb3dK/piQGzlhGb5tse488aF6OsK+r4sZC75UTGNpd+8Lnzc9N9
         HXPPGO04Oq4XVW12j0I21Xp3XVjITYXhhcTOmpzpC7YoZPSCjBZczyl4a+9dW3xNphyd
         e8ug==
X-Forwarded-Encrypted: i=1; AJvYcCWAwLmyTh2i0Y4t+4IR9tytzmU38Mm1DMLGt7Sjmg8uZK7N6b8NE+HGiK01pieeIQ/oxCwHKJspHZiWrQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxcBElQ/nte1FltjhUNyfsig/kQuxn4YuWiPOTPGtxbFDrIl7zN
	CYsO2cSv49O8U+dT8aw4yMSsOSfbuOGP58cyqlcqczCQftFGZS7ok2N4
X-Gm-Gg: ASbGncuKi94yJhBOyOn+DbjNADWkrfU4hnCS/1LsCgZHNMW0D/UStYbgTH1UQmnk+5J
	cpLE9gvVYtouxiqUeuf+zsNofrlbA1nrAtJaj5KE4hhec85GrOweYk21LgeGnrUpiYT5i2q4pJm
	mu3UVox1fFtde7Q5sQJstZedoaeBoDNkR2n1s7O6Uu1Ty+pxWZOz5KaBlf+Ftd8F6a9FpWzRLnv
	yifPq43gAliDcDiKYoKIp+SwEika7DsYLre2wj1+ucEdwWtYAhZt76RdksI7b1ZAbjpJnd2hWH5
	d4mO/YxAYUBMV9OguC1xmDs+fHS0+Ulj8vPGDmZJx2aMxupDBtNxzBUKh1yP0c3MYQNrjog90kA
	jxagOn7EhRLdBIJ8Bi3q6MotheG3jg79IvBcPhcE2qA==
X-Google-Smtp-Source: AGHT+IGXSHsujaSl2ROKONAWQE6+Ygosv4F3z5UVve5pQ4wzulH1rYWqg7jKwQSm4YJbOk69qQJB0w==
X-Received: by 2002:a17:90b:4b87:b0:324:f79c:2dd2 with SMTP id 98e67ed59e1d1-327e666e931mr5142096a91.8.1756575540232;
        Sat, 30 Aug 2025 10:39:00 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:38:59 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Date: Sun, 31 Aug 2025 02:38:48 +0900
Message-Id: <20250830173850.323897-1-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 49882410E9
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.169:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,lists.linaro.org,broadcom.com,raspberrypi.com,ideasonboard.com,lists.infradead.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-MailFrom: nogunix@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: R6PBTBKNB3WTDRN2B6GBQVSNECZF5BM3
X-Message-ID-Hash: R6PBTBKNB3WTDRN2B6GBQVSNECZF5BM3
X-Mailman-Approved-At: Sun, 31 Aug 2025 00:50:38 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, dave.stevenson@raspberrypi.com, laurent.pinchart@ideasonboard.com, hverkuil@kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Masaharu Noguchi <nogunix@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] staging: fix W=1 format-truncation warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/R6PBTBKNB3WTDRN2B6GBQVSNECZF5BM3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

    - This series fixes -Wformat-truncation warnings in staging drivers found with W=1 builds:
    - greybus: prefix device id to widget/control names safely
    - vc04_services/bcm2835-camera: compose V4L2 bus_info safely
    Both changes use scnprintf() for the prefix and strscpy() for the remainder. No functional change
    intended.

Masaharu Noguchi (2):
  staging: greybus: audio_topology: avoid -Wformat-truncation
  staging: vc04_services: bcm2835-camera: avoid -Wformat-truncation

 drivers/staging/greybus/audio_topology.c              | 11 ++++++-----
 .../vc04_services/bcm2835-camera/bcm2835-camera.c     |  5 +++--
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

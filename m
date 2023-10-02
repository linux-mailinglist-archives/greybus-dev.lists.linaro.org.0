Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0367B59FA
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Oct 2023 20:26:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4747040D69
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Oct 2023 18:26:34 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	by lists.linaro.org (Postfix) with ESMTPS id 21EFF3EC33
	for <greybus-dev@lists.linaro.org>; Mon,  2 Oct 2023 18:26:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=QpIWJBtJ;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.219.176 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d865854ef96so45193276.2
        for <greybus-dev@lists.linaro.org>; Mon, 02 Oct 2023 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696271186; x=1696875986; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UigAivXAAGoiJrn0MflIK+cO30h4BgtNGjH95iW+1cc=;
        b=QpIWJBtJeRI4pfZIqyWwAkyTJ1zFj/1jrIkg+ggMRT5zov3xM1Si6WfeFNHHE5S1sr
         ySYGzWNRNDpw+YkonUa7kWpatUnbl6petRyZVTk2PLSAd8Ek3WEAMJQTJfzIXzlKFP+P
         wHkziZK2b0uBxNfi0HfkSgU/8P5zI9uyRYeZehkyGZgVNjSnfPA2p3mRFcUuwy1Jbyhw
         YFI8d5cZfKHnChvbUZELQgTCBsisCXE1s/5M7rMiEUCiLJANSEpghiszyMgyx2SKrj+n
         WUU+gR0L2voiO4QwtGanivUNGnZJdnRZqnNAiOMDg0Fd0uT4ZX854Vy+QLAQCCiSGadB
         Ud4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696271186; x=1696875986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UigAivXAAGoiJrn0MflIK+cO30h4BgtNGjH95iW+1cc=;
        b=N/wKml8NsoW8gSbub342q6l9L2xFQfXpYzoB3rPpOyzA+U63QDxQK5mm5wtU6LH/cv
         KotGuCuCX/9I9t4dDPrPZHqeJT4C/yG3PMcu/Vqjko8EpstxNTdxts6F7TSbVN5N5pn2
         Gv/isdTnq0we0kenPPAeBtDFB6LvEJrgkojpiRTYhIG330DBhw1v0d2i/oq7GzY0AQUg
         ElCf0e8jeDPfCzjyKVsG3OFVatx9c6jTlCQwDpd4Ci7Aet5Omob+cych8mug5X662zoq
         Ngslo2aZ564vGuieUzV3WxVjS16TkduuHKnKfF/PnQrkRXb23xCxNkOJBIYUr+4xVw3u
         bzqw==
X-Gm-Message-State: AOJu0Yw5NHLwDqn9rrYHeRLolHePs2iZm9eOzg8w0YsFLUu4BFmHNoF+
	fzs125yf0Fd+1rLqx797PDfMx9sUwPI=
X-Google-Smtp-Source: AGHT+IFzbMDwqxVflQ7EiVC/zH+6T85RjWEmQrguJToZK7EIiMNEqgG6bD8x65C6zsrQ6oyEcSV9mg==
X-Received: by 2002:a25:ab81:0:b0:d7b:ac56:493b with SMTP id v1-20020a25ab81000000b00d7bac56493bmr11335305ybi.7.1696271186318;
        Mon, 02 Oct 2023 11:26:26 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id a8-20020a637f08000000b0057d86bb613esm17249584pgd.45.2023.10.02.11.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:26:25 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Mon,  2 Oct 2023 23:54:49 +0530
Message-ID: <20231002182454.211165-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org];
	URIBL_BLOCKED(0.00)[linaro.org:url,programmershideaway.xyz:url,mail-yb1-f176.google.com:helo,mail-yb1-f176.google.com:rdns];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.176:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 21EFF3EC33
Message-ID-Hash: NYA3N2JYG3WIRCDXHYINNXYOCSVYRTSF
X-Message-ID-Hash: NYA3N2JYG3WIRCDXHYINNXYOCSVYRTSF
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NYA3N2JYG3WIRCDXHYINNXYOCSVYRTSF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

BeagleConnect is both a technology concept and a line of board designs
that implement the technology. Born from Greybus, a mechanism for
dynamically extending a Linux system with embedded peripherals,
BeagleConnect adds two key elements: a 6LoWPAN transport and mikroBUS
manifests. The 6LoWPAN transport provides for arbitrary connections,
including the IEEE802.15.4g long-range wireless transport supported
between BeaglePlay and BeagleConnect Freedom (the first BeagleConnect
board design). The mikroBUS manifests provide for rapid prototyping
and low-node-count production with sensor boards following the
mikroBUS freely-licensable embedded bus standard such that existing
Linux drivers can be loaded upon Greybus discovery of the nodes.

This patch set provides the Linux-side hooks required for the 6LoWPAN
transport for BeagleConnect on BeaglePlay. Also adds required devicetree
additions.

Tested over `next-20230825`.

Link: https://programmershideaway.xyz/tags/gsoc23/ GSoC23 Blog
Link: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware Zephyr App
Link: https://github.com/Ayush1325/linux/tree/gb-beagleplay GitHub Branch
Link: https://docs.beagleboard.org/latest/boards/beagleconnect/index.html BeagleConnect
Link: https://docs.beagleboard.org/latest/boards/beagleplay/index.html BeaglePlay
Link: https://github.com/Ayush1325/linux/tree/gb-beagleplay Github Repo
Link: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/BGNHBVKBO7OUXBKKBZY6BC2CO3EYZCLE/ Patch v5

Changes in Patch v6
v5 -> v6:
- Rename compatible to `ti,cc1352p7`
- Fix formatting
- Use kerneldoc
- Add clocks, power-gpios, reset-gpios to dt bindings

v4 -> v5:
- Move DT Bindings to net
- Rename compatible to `beagle,play-cc1352`
- Expose CC1352 as MCU
- Remove redundant tracing messages
- Fix memory leaks

v3 -> v4:
- Add DT Bindings
- Reorder commits
- Improve commit messages

v2 -> v3:
- Move gb-beagleplay out of staging

v1 -> v2:
- Combine the driver into a single file
- Remove redundant code
- Fix Checkpatch complaints
- Other suggested changes

Ayush Singh (3):
  dt-bindings: Add beaglecc1352
  greybus: Add BeaglePlay Linux Driver
  dts: ti: k3-am625-beagleplay: Add beaglecc1352

 .../devicetree/bindings/net/ti,cc1352p7.yaml  |  48 ++
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
 drivers/greybus/Kconfig                       |  10 +
 drivers/greybus/Makefile                      |   2 +
 drivers/greybus/gb-beagleplay.c               | 495 ++++++++++++++++++
 6 files changed, 566 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
 create mode 100644 drivers/greybus/gb-beagleplay.c


base-commit: 6269320850097903b30be8f07a5c61d9f7592393
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

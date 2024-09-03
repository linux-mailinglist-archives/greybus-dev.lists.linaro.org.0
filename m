Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EA84096990F
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 11:33:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0548040F7F
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 09:33:14 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	by lists.linaro.org (Postfix) with ESMTPS id 35C0D40F7F
	for <greybus-dev@lists.linaro.org>; Tue,  3 Sep 2024 09:33:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=Uds34YqU;
	spf=neutral (lists.linaro.org: 209.85.210.47 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-70f6118f1b5so3206811a34.0
        for <greybus-dev@lists.linaro.org>; Tue, 03 Sep 2024 02:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725355989; x=1725960789; darn=lists.linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+RntZ4TKPgJ83xM8E1VHb1TVHAZ7oR+PPNqSgiu05M=;
        b=Uds34YqUNC7eAnOc4y3EIHbmoon/nv/pxI4LICxC0Y/nPnnvewIiOBO0T1jI8k6NyX
         NoUh2VDP8WtV9jpD8JpRvWMIOCnSn3fEgNz4sjMnVDqhxJONJA2dKB2GXpSCU1dpar3w
         NMH5yB4bP6OpY4eiRocnpgpr39185QCh2ztNAGXVEyt/ds9I0fr0TuIKBFhNzb79WCET
         p4lmyjSVnND76flG1snuEdx4X7yUbDpl6MPmb+ib/uDgAzz+wa+BLcWm7IrDbtBekUKd
         9oozLOrMVaWh+D5APv4jdTZ3rwLEkNIDkuTzaF4bF3fkRsyJLu9iX7GnUz6c6zZUY0eW
         HCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355989; x=1725960789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+RntZ4TKPgJ83xM8E1VHb1TVHAZ7oR+PPNqSgiu05M=;
        b=cGrQhXWf2Au5E2jBs5GOiN3E5WeecPdIc4onmtd5YRIB0PS+ql1o0GxJqm/SB1ZiJl
         S3tWg/gs5t9BkDQdI9hY+bpO6J3RENS5v8n6vHtBjIIC31P/E2nV8nbsY8vyFawvuOMd
         J9ubM9omrMu+OjSY6AtzqfAlbCUX8U4C2aAWVdqsphvqMQaXXXQAu+fT0qpGdP+vF0Yk
         LPbjrK9j9hf8jJUrIIycGyfrvH0Hl/8JQIMzGhJbHUh3NEh274Jv3ZHuwg+skHidHw7c
         RW02cnSyNMUBmlDAsCDBYbaw3GIjhuf5qJKZBPsj5Tll8MNBkIHHKrRgJ4BaodYqVEXC
         +kMg==
X-Gm-Message-State: AOJu0Yxnkgn9R2AN7mgKZenh2ayJ1P8ZojZqirTlsyHIIN6l5aoHTlIa
	da9u9WkRZPBMyWWQiDREpRaYmffIA7OQNneVMfY6HiURbuXnMRpiqzPlUV0Ieg==
X-Google-Smtp-Source: AGHT+IEg0lJl5/lZ5jrU6aG5mLySM/tKlGvW6bh/MFwKa8Sge7iFZlkRVLE1v4F4gvg//LFtRWlzSA==
X-Received: by 2002:a05:6358:9499:b0:1b5:fb38:5ed0 with SMTP id e5c5f4694b2df-1b7ef69be82mr1133321855d.2.1725355989509;
        Tue, 03 Sep 2024 02:33:09 -0700 (PDT)
Received: from [172.22.57.189] ([117.250.76.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d72d1sm8365868b3a.170.2024.09.03.02.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:33:09 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Sep 2024 15:02:18 +0530
MIME-Version: 1.0
Message-Id: <20240903-beagleplay_fw_upgrade-v4-1-526fc62204a7@beagleboard.org>
References: <20240903-beagleplay_fw_upgrade-v4-0-526fc62204a7@beagleboard.org>
In-Reply-To: <20240903-beagleplay_fw_upgrade-v4-0-526fc62204a7@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=kQLyNykQqBQZJ3maZQVcRjGOkfhOeqGO9xiQOZ8mkaQ=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm1tfEROETaiK0xZE+/xP/CCiBas9g0tnCDrPh2
 6uOZ6ctZ4OJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtbXxAAKCRAFzvXHieVa
 dCWREACeAyCLjk+BnzVkk4TyPyrAoCeqn7+bLAr5Pfi4umCwAiHUDDKMbbP/JsaWdv8atIunthE
 O0DLqohZeN+zbK1TgRyLgUfvzR9/daqgWXkffQIcr/OMR4Q/03InYm+gV8bcJzZOD9S5mjSJefd
 MYIyLQN34dCeF/ko4T7E/1fG/Z4X8X5/2CFmOTDVUteJGQ4Get1Se7OFeHZhqgB0qFMtYpexH++
 SAWKGiQtBh0pg7U24VUL94LqL3WSBdwq/RA32PG1mYh4NeUARmmb3EkM5ViNX3+d2y00vHVlcYp
 deTSPH2WntnTnrNhBFUFIke1e300B+ZiCAYXBoDdPVs2UypmmakrWbJn75opmwt+ntI62Mrnk8w
 RTT6X/qnCy7uEf3lz4Ks6LCrJTt3fpdHR64zQr36JxfQO8VgXa2uiISQwflERfwwJ8LDUe1SHEo
 mjpTOa5IsZSxo3icqCYvf//aPsRchfSRWOLVFHK3PZtGFWsmYnX49VWBd+g9GZMt7Qhagc86W8d
 XRjBgJsIJ7N7y2NHdFPs4TKwurGUNRm1ZkJvh9JFKQfndKBk/Of3/H5LLtmejwL6OpvfyYbUlkb
 boLkDdMuXJQJJplMCQdUAh8CVlzgdYXcTiSeQhw2DuswubEDEl3FKD9ebwSWjcZZeXV9xCfNHt6
 B+6IHlYenQdE1Gw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Action: no action
X-Spamd-Bar: -----
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 35C0D40F7F
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.47:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_RCPT(0.00)[dt];
	R_SPF_NEUTRAL(0.00)[?all:c];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
Message-ID-Hash: EO2YNVZYDYNJRJXF7WY3DO4FLESC45RJ
X-Message-ID-Hash: EO2YNVZYDYNJRJXF7WY3DO4FLESC45RJ
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 1/3] dt-bindings: net: ti,cc1352p7: Add bootloader-backdoor-gpios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EO2YNVZYDYNJRJXF7WY3DO4FLESC45RJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bootloader-backdoor-gpio (along with reset-gpio) is used to enable
bootloader backdoor for flashing new firmware.

The pin and pin level to enable bootloader backdoor is configured using
the following CCFG variables in cc1352p7:
- SET_CCFG_BL_CONFIG_BL_PIN_NO
- SET_CCFG_BL_CONFIG_BL_LEVEL

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
index 3dde10de4630..4f4253441547 100644
--- a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
+++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
@@ -29,6 +29,12 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  bootloader-backdoor-gpios:
+    maxItems: 1
+    description: |
+      gpios to enable bootloader backdoor in cc1352p7 bootloader to allow
+      flashing new firmware.
+
   vdds-supply: true
 
 required:
@@ -46,6 +52,7 @@ examples:
         clocks = <&sclk_hf 0>, <&sclk_lf 25>;
         clock-names = "sclk_hf", "sclk_lf";
         reset-gpios = <&pio 35 GPIO_ACTIVE_LOW>;
+        bootloader-backdoor-gpios = <&pio 36 GPIO_ACTIVE_LOW>;
         vdds-supply = <&vdds>;
       };
     };

-- 
2.46.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

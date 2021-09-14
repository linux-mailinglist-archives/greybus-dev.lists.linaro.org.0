Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 026FB40AA6A
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Sep 2021 11:14:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 925BE61ECD
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Sep 2021 09:14:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 23E7D62164; Tue, 14 Sep 2021 09:14:27 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9235061A44;
	Tue, 14 Sep 2021 09:14:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0AA616194E
 for <greybus-dev@lists.linaro.org>; Tue, 14 Sep 2021 09:14:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F3D89619C1; Tue, 14 Sep 2021 09:14:22 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by lists.linaro.org (Postfix) with ESMTPS id D69776194E
 for <greybus-dev@lists.linaro.org>; Tue, 14 Sep 2021 09:14:20 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 47E81200E2;
 Tue, 14 Sep 2021 09:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631610859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txOd2IWUIzDSEFZp5372yeQmEvrfSft2wWeQObhBtmQ=;
 b=Ji4MUNTGGQyTZ+hFIkdlpNPwXoDGHzXXxeiGQdON33E6pNbzW2NNz4JwLSSygvyeVFt5mD
 jAYuWzaViaue1ATKk9rn29sxKWgt0g8c1sTzvmvwIqSBh95Jy1HQhWl+rAulc/PdEJKgRJ
 oLN9rqe/K1wnjGFqZFv+rbRhWZVGiGo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631610859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txOd2IWUIzDSEFZp5372yeQmEvrfSft2wWeQObhBtmQ=;
 b=ttzstxSjRCq5UcgkxklHOopri5R6NOZ5g0oejhtNt08CifpekTXQdd46iYbLByipBFi3cy
 i+UW18w74OUJsiBg==
Received: from localhost.localdomain (unknown [10.100.201.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 161CCA3B8E;
 Tue, 14 Sep 2021 09:14:19 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Date: Tue, 14 Sep 2021 11:14:13 +0200
Message-Id: <20210914091415.17918-7-jslaby@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914091415.17918-1-jslaby@suse.cz>
References: <20210914091134.17426-1-jslaby@suse.cz>
 <20210914091415.17918-1-jslaby@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH 14/16] tty: drivers/staging/,
 stop using tty_flip_buffer_push
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: Alex Elder <elder@kernel.org>, linux-staging@lists.linux.dev,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-serial@vger.kernel.org,
 David Lin <dtwlin@gmail.com>, Jiri Slaby <jslaby@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Since commit a9c3f68f3cd8d (tty: Fix low_latency BUG) in 2014,
tty_flip_buffer_push() is only a wrapper to tty_schedule_flip(). We are
going to remove the former, so call the latter directly in
drivers/staging/.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: David Lin <dtwlin@gmail.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: linux-staging@lists.linux.dev
Cc: greybus-dev@lists.linaro.org
---
 drivers/staging/fwserial/fwserial.c | 4 ++--
 drivers/staging/gdm724x/gdm_tty.c   | 2 +-
 drivers/staging/greybus/uart.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fwserial/fwserial.c b/drivers/staging/fwserial/fwserial.c
index e8fa7f53cd5e..b2d3f95edbc3 100644
--- a/drivers/staging/fwserial/fwserial.c
+++ b/drivers/staging/fwserial/fwserial.c
@@ -518,7 +518,7 @@ static void fwtty_emit_breaks(struct work_struct *work)
 		if (c < t)
 			break;
 	}
-	tty_flip_buffer_push(&port->port);
+	tty_schedule_flip(&port->port);
 
 	if (port->mstatus & (UART_LSR_BI << 24))
 		schedule_delayed_work(&port->emit_breaks, FREQ_BREAKS);
@@ -565,7 +565,7 @@ static int fwtty_rx(struct fwtty_port *port, unsigned char *data, size_t len)
 
 	c = tty_insert_flip_string_fixed_flag(&port->port, data, TTY_NORMAL, n);
 	if (c > 0)
-		tty_flip_buffer_push(&port->port);
+		tty_schedule_flip(&port->port);
 	n -= c;
 
 	if (n) {
diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 04df6f9f5403..95a3b4e61fec 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -129,7 +129,7 @@ static int gdm_tty_recv_complete(void *data,
 	if (data && len) {
 		if (tty_buffer_request_room(&gdm->port, len) == len) {
 			tty_insert_flip_string(&gdm->port, data, len);
-			tty_flip_buffer_push(&gdm->port);
+			tty_schedule_flip(&gdm->port);
 		} else {
 			return TO_HOST_BUFFER_REQUEST_FAIL;
 		}
diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index e6d860a9678e..2bdc2401b652 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -122,7 +122,7 @@ static int gb_uart_receive_data_handler(struct gb_operation *op)
 			recv_data_size, count);
 	}
 	if (count)
-		tty_flip_buffer_push(port);
+		tty_schedule_flip(port);
 	return 0;
 }
 
-- 
2.33.0

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev

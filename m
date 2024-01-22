Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 13989838B2E
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Jan 2024 10:58:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25DED40C96
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Jan 2024 09:58:33 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	by lists.linaro.org (Postfix) with ESMTPS id 0E2FD3EFEA
	for <greybus-dev@lists.linaro.org>; Mon, 22 Jan 2024 18:06:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=dolcini.it header.s=default header.b=Zi6Myr57;
	dmarc=pass (policy=none) header.from=dolcini.it;
	spf=pass (lists.linaro.org: domain of francesco@dolcini.it designates 217.194.8.81 as permitted sender) smtp.mailfrom=francesco@dolcini.it
Received: from francesco-nb.corp.toradex.com (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 67CE622DCC;
	Mon, 22 Jan 2024 19:06:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1705946763;
	bh=6vmspUlyFF0tv6FWxmPxRZWMIp1WG5lqggaZecdXjLc=; h=From:To:Subject;
	b=Zi6Myr576mJnMleI46qoBR89eX16nrcL+uex4pAEtqdDrpvTVltKVXle2ClHxvnV0
	 DV3B5A6Y1t5AiqCYirVIedAoq3iYD3ad99dFGE3ugNpRQkndGhvct7V4/e3WikwgfP
	 Q2fuo1coIJDHa4FdSDO78qkTE37N9pDwZ4R2uaSpv/mw5YhpTk06x1kREn6SIpOFYU
	 37kXI3jbvnhfD/MI148/z5CCtC8iKMjGGdg9NrjL98jvDj6yH1pFDEFmOK0RVbSyIU
	 D/ZfU6dCDgXVT/6FBtEVfBIu2DIEf5CHeYs3t0/HM1Zivbuqwvi9L0dFA2itdZhYxh
	 Wd9mZHuMQrV3A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-iio@vger.kernel.org,
	netdev@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-sound@vger.kernel.org
Date: Mon, 22 Jan 2024 19:05:51 +0100
Message-Id: <20240122180551.34429-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0E2FD3EFEA
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[dolcini.it,none];
	R_SPF_ALLOW(-0.20)[+ip4:217.194.8.64/26];
	R_DKIM_ALLOW(-0.20)[dolcini.it:s=default];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:12637, ipnet:217.194.0.0/20, country:IT];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[toradex.com,gmail.com,kernel.org,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org,huawei.com];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[dolcini.it:+]
X-MailFrom: francesco@dolcini.it
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CT47X4QQR5UCKT63GK3UHHWRH2442XNF
X-Message-ID-Hash: CT47X4QQR5UCKT63GK3UHHWRH2442XNF
X-Mailman-Approved-At: Tue, 23 Jan 2024 09:58:28 +0000
CC: Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CT47X4QQR5UCKT63GK3UHHWRH2442XNF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

receive_buf() is called from ttyport_receive_buf() that expects values
">= 0" from serdev_controller_receive_buf(), change its return type from
ssize_t to size_t.

The need for this clean-up was noticed while fixing a warning, see
commit 94d053942544 ("Bluetooth: btnxpuart: fix recv_buf() return value").
Changing the callback prototype to return an unsigned seems the best way
to document the API and ensure that is properly used.

GNSS drivers implementation of serdev receive_buf() callback return
directly the return value of gnss_insert_raw(). gnss_insert_raw()
returns a signed int, however this is not an issue since the value
returned is always positive, because of the kfifo_in() implementation.
gnss_insert_raw() could be changed to return also an unsigned, however
this is not implemented here as request by the GNSS maintainer Johan
Hovold.

Suggested-by: Jiri Slaby <jirislaby@kernel.org>
Link: https://lore.kernel.org/all/087be419-ec6b-47ad-851a-5e1e3ea5cfcc@kernel.org/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> #for-iio
---
v1:
 - https://lore.kernel.org/all/20231214170146.641783-1-francesco@dolcini.it/
v2:
 - rebased on 6.8-rc1
 - add acked-by Jonathan
 - do not change gnss_insert_raw()
 - do not change the code style of the gnss code
 - commit message improvements, explain the reasons for doing only minimal
   changes on the GNSS part
---
 drivers/bluetooth/btmtkuart.c              |  4 ++--
 drivers/bluetooth/btnxpuart.c              |  4 ++--
 drivers/bluetooth/hci_serdev.c             |  4 ++--
 drivers/gnss/serial.c                      |  2 +-
 drivers/gnss/sirf.c                        |  2 +-
 drivers/greybus/gb-beagleplay.c            |  6 +++---
 drivers/iio/chemical/pms7003.c             |  4 ++--
 drivers/iio/chemical/scd30_serial.c        |  4 ++--
 drivers/iio/chemical/sps30_serial.c        |  4 ++--
 drivers/iio/imu/bno055/bno055_ser_core.c   |  4 ++--
 drivers/mfd/rave-sp.c                      |  4 ++--
 drivers/net/ethernet/qualcomm/qca_uart.c   |  2 +-
 drivers/nfc/pn533/uart.c                   |  4 ++--
 drivers/nfc/s3fwrn5/uart.c                 |  4 ++--
 drivers/platform/chrome/cros_ec_uart.c     |  4 ++--
 drivers/platform/surface/aggregator/core.c |  4 ++--
 drivers/tty/serdev/serdev-ttyport.c        | 10 ++++------
 include/linux/serdev.h                     |  8 ++++----
 sound/drivers/serial-generic.c             |  4 ++--
 19 files changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 3c84fcbda01a..e6bc4a73c9fc 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -383,8 +383,8 @@ static void btmtkuart_recv(struct hci_dev *hdev, const u8 *data, size_t count)
 	}
 }
 
-static ssize_t btmtkuart_receive_buf(struct serdev_device *serdev,
-				     const u8 *data, size_t count)
+static size_t btmtkuart_receive_buf(struct serdev_device *serdev,
+				    const u8 *data, size_t count)
 {
 	struct btmtkuart_dev *bdev = serdev_device_get_drvdata(serdev);
 
diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index 1d592ac413d1..056bef5b2919 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -1264,8 +1264,8 @@ static const struct h4_recv_pkt nxp_recv_pkts[] = {
 	{ NXP_RECV_FW_REQ_V3,   .recv = nxp_recv_fw_req_v3 },
 };
 
-static ssize_t btnxpuart_receive_buf(struct serdev_device *serdev,
-				     const u8 *data, size_t count)
+static size_t btnxpuart_receive_buf(struct serdev_device *serdev,
+				    const u8 *data, size_t count)
 {
 	struct btnxpuart_dev *nxpdev = serdev_device_get_drvdata(serdev);
 
diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index 39c8b567da3c..a3c3beb2806d 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -271,8 +271,8 @@ static void hci_uart_write_wakeup(struct serdev_device *serdev)
  *
  * Return: number of processed bytes
  */
-static ssize_t hci_uart_receive_buf(struct serdev_device *serdev,
-				    const u8 *data, size_t count)
+static size_t hci_uart_receive_buf(struct serdev_device *serdev,
+				   const u8 *data, size_t count)
 {
 	struct hci_uart *hu = serdev_device_get_drvdata(serdev);
 
diff --git a/drivers/gnss/serial.c b/drivers/gnss/serial.c
index baa956494e79..0e43bf6294f8 100644
--- a/drivers/gnss/serial.c
+++ b/drivers/gnss/serial.c
@@ -80,7 +80,7 @@ static const struct gnss_operations gnss_serial_gnss_ops = {
 	.write_raw	= gnss_serial_write_raw,
 };
 
-static ssize_t gnss_serial_receive_buf(struct serdev_device *serdev,
+static size_t gnss_serial_receive_buf(struct serdev_device *serdev,
 				       const u8 *buf, size_t count)
 {
 	struct gnss_serial *gserial = serdev_device_get_drvdata(serdev);
diff --git a/drivers/gnss/sirf.c b/drivers/gnss/sirf.c
index 6801a8fb2040..79375d14bbb6 100644
--- a/drivers/gnss/sirf.c
+++ b/drivers/gnss/sirf.c
@@ -160,7 +160,7 @@ static const struct gnss_operations sirf_gnss_ops = {
 	.write_raw	= sirf_write_raw,
 };
 
-static ssize_t sirf_receive_buf(struct serdev_device *serdev,
+static size_t sirf_receive_buf(struct serdev_device *serdev,
 				const u8 *buf, size_t count)
 {
 	struct sirf_data *data = serdev_device_get_drvdata(serdev);
diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index c3e90025064b..33f8fad70260 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -271,7 +271,7 @@ static void hdlc_rx_frame(struct gb_beagleplay *bg)
 	}
 }
 
-static ssize_t hdlc_rx(struct gb_beagleplay *bg, const u8 *data, size_t count)
+static size_t hdlc_rx(struct gb_beagleplay *bg, const u8 *data, size_t count)
 {
 	size_t i;
 	u8 c;
@@ -331,8 +331,8 @@ static void hdlc_deinit(struct gb_beagleplay *bg)
 	flush_work(&bg->tx_work);
 }
 
-static ssize_t gb_tty_receive(struct serdev_device *sd, const u8 *data,
-			      size_t count)
+static size_t gb_tty_receive(struct serdev_device *sd, const u8 *data,
+			     size_t count)
 {
 	struct gb_beagleplay *bg = serdev_device_get_drvdata(sd);
 
diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7003.c
index b5cf15a515d2..43025866d5b7 100644
--- a/drivers/iio/chemical/pms7003.c
+++ b/drivers/iio/chemical/pms7003.c
@@ -211,8 +211,8 @@ static bool pms7003_frame_is_okay(struct pms7003_frame *frame)
 	return checksum == pms7003_calc_checksum(frame);
 }
 
-static ssize_t pms7003_receive_buf(struct serdev_device *serdev, const u8 *buf,
-				   size_t size)
+static size_t pms7003_receive_buf(struct serdev_device *serdev, const u8 *buf,
+				  size_t size)
 {
 	struct iio_dev *indio_dev = serdev_device_get_drvdata(serdev);
 	struct pms7003_state *state = iio_priv(indio_dev);
diff --git a/drivers/iio/chemical/scd30_serial.c b/drivers/iio/chemical/scd30_serial.c
index a47654591e55..2adb76dbb020 100644
--- a/drivers/iio/chemical/scd30_serial.c
+++ b/drivers/iio/chemical/scd30_serial.c
@@ -174,8 +174,8 @@ static int scd30_serdev_command(struct scd30_state *state, enum scd30_cmd cmd, u
 	return 0;
 }
 
-static ssize_t scd30_serdev_receive_buf(struct serdev_device *serdev,
-					const u8 *buf, size_t size)
+static size_t scd30_serdev_receive_buf(struct serdev_device *serdev,
+				       const u8 *buf, size_t size)
 {
 	struct iio_dev *indio_dev = serdev_device_get_drvdata(serdev);
 	struct scd30_serdev_priv *priv;
diff --git a/drivers/iio/chemical/sps30_serial.c b/drivers/iio/chemical/sps30_serial.c
index 3afa89f8acc3..a6dfbe28c914 100644
--- a/drivers/iio/chemical/sps30_serial.c
+++ b/drivers/iio/chemical/sps30_serial.c
@@ -210,8 +210,8 @@ static int sps30_serial_command(struct sps30_state *state, unsigned char cmd,
 	return rsp_size;
 }
 
-static ssize_t sps30_serial_receive_buf(struct serdev_device *serdev,
-					const u8 *buf, size_t size)
+static size_t sps30_serial_receive_buf(struct serdev_device *serdev,
+				       const u8 *buf, size_t size)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(&serdev->dev);
 	struct sps30_serial_priv *priv;
diff --git a/drivers/iio/imu/bno055/bno055_ser_core.c b/drivers/iio/imu/bno055/bno055_ser_core.c
index 5677bdf4f846..694ff14a3aa2 100644
--- a/drivers/iio/imu/bno055/bno055_ser_core.c
+++ b/drivers/iio/imu/bno055/bno055_ser_core.c
@@ -378,8 +378,8 @@ static void bno055_ser_handle_rx(struct bno055_ser_priv *priv, int status)
  * Also, we assume to RX one pkt per time (i.e. the HW doesn't send anything
  * unless we require to AND we don't queue more than one request per time).
  */
-static ssize_t bno055_ser_receive_buf(struct serdev_device *serdev,
-				      const u8 *buf, size_t size)
+static size_t bno055_ser_receive_buf(struct serdev_device *serdev,
+				     const u8 *buf, size_t size)
 {
 	int status;
 	struct bno055_ser_priv *priv = serdev_device_get_drvdata(serdev);
diff --git a/drivers/mfd/rave-sp.c b/drivers/mfd/rave-sp.c
index 6ff84b2600c5..62a6613fb070 100644
--- a/drivers/mfd/rave-sp.c
+++ b/drivers/mfd/rave-sp.c
@@ -471,8 +471,8 @@ static void rave_sp_receive_frame(struct rave_sp *sp,
 		rave_sp_receive_reply(sp, data, length);
 }
 
-static ssize_t rave_sp_receive_buf(struct serdev_device *serdev,
-				   const u8 *buf, size_t size)
+static size_t rave_sp_receive_buf(struct serdev_device *serdev,
+				  const u8 *buf, size_t size)
 {
 	struct device *dev = &serdev->dev;
 	struct rave_sp *sp = dev_get_drvdata(dev);
diff --git a/drivers/net/ethernet/qualcomm/qca_uart.c b/drivers/net/ethernet/qualcomm/qca_uart.c
index 223321897b96..20f50bde82ac 100644
--- a/drivers/net/ethernet/qualcomm/qca_uart.c
+++ b/drivers/net/ethernet/qualcomm/qca_uart.c
@@ -58,7 +58,7 @@ struct qcauart {
 	unsigned char *tx_buffer;
 };
 
-static ssize_t
+static size_t
 qca_tty_receive(struct serdev_device *serdev, const u8 *data, size_t count)
 {
 	struct qcauart *qca = serdev_device_get_drvdata(serdev);
diff --git a/drivers/nfc/pn533/uart.c b/drivers/nfc/pn533/uart.c
index 2eb5978bd79e..cfbbe0713317 100644
--- a/drivers/nfc/pn533/uart.c
+++ b/drivers/nfc/pn533/uart.c
@@ -203,8 +203,8 @@ static int pn532_uart_rx_is_frame(struct sk_buff *skb)
 	return 0;
 }
 
-static ssize_t pn532_receive_buf(struct serdev_device *serdev,
-				 const u8 *data, size_t count)
+static size_t pn532_receive_buf(struct serdev_device *serdev,
+				const u8 *data, size_t count)
 {
 	struct pn532_uart_phy *dev = serdev_device_get_drvdata(serdev);
 	size_t i;
diff --git a/drivers/nfc/s3fwrn5/uart.c b/drivers/nfc/s3fwrn5/uart.c
index 456d3947116c..9c09c10c2a46 100644
--- a/drivers/nfc/s3fwrn5/uart.c
+++ b/drivers/nfc/s3fwrn5/uart.c
@@ -51,8 +51,8 @@ static const struct s3fwrn5_phy_ops uart_phy_ops = {
 	.write = s3fwrn82_uart_write,
 };
 
-static ssize_t s3fwrn82_uart_read(struct serdev_device *serdev,
-				  const u8 *data, size_t count)
+static size_t s3fwrn82_uart_read(struct serdev_device *serdev,
+				 const u8 *data, size_t count)
 {
 	struct s3fwrn82_uart_phy *phy = serdev_device_get_drvdata(serdev);
 	size_t i;
diff --git a/drivers/platform/chrome/cros_ec_uart.c b/drivers/platform/chrome/cros_ec_uart.c
index 68d80559fddc..8ea867c2a01a 100644
--- a/drivers/platform/chrome/cros_ec_uart.c
+++ b/drivers/platform/chrome/cros_ec_uart.c
@@ -81,8 +81,8 @@ struct cros_ec_uart {
 	struct response_info response;
 };
 
-static ssize_t cros_ec_uart_rx_bytes(struct serdev_device *serdev,
-				     const u8 *data, size_t count)
+static size_t cros_ec_uart_rx_bytes(struct serdev_device *serdev,
+				    const u8 *data, size_t count)
 {
 	struct ec_host_response *host_response;
 	struct cros_ec_device *ec_dev = serdev_device_get_drvdata(serdev);
diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
index 9591a28bc38a..ba550eaa06fc 100644
--- a/drivers/platform/surface/aggregator/core.c
+++ b/drivers/platform/surface/aggregator/core.c
@@ -227,8 +227,8 @@ EXPORT_SYMBOL_GPL(ssam_client_bind);
 
 /* -- Glue layer (serdev_device -> ssam_controller). ------------------------ */
 
-static ssize_t ssam_receive_buf(struct serdev_device *dev, const u8 *buf,
-				size_t n)
+static size_t ssam_receive_buf(struct serdev_device *dev, const u8 *buf,
+			       size_t n)
 {
 	struct ssam_controller *ctrl;
 	int ret;
diff --git a/drivers/tty/serdev/serdev-ttyport.c b/drivers/tty/serdev/serdev-ttyport.c
index e94e090cf0a1..3d7ae7fa5018 100644
--- a/drivers/tty/serdev/serdev-ttyport.c
+++ b/drivers/tty/serdev/serdev-ttyport.c
@@ -27,19 +27,17 @@ static size_t ttyport_receive_buf(struct tty_port *port, const u8 *cp,
 {
 	struct serdev_controller *ctrl = port->client_data;
 	struct serport *serport = serdev_controller_get_drvdata(ctrl);
-	int ret;
+	size_t ret;
 
 	if (!test_bit(SERPORT_ACTIVE, &serport->flags))
 		return 0;
 
 	ret = serdev_controller_receive_buf(ctrl, cp, count);
 
-	dev_WARN_ONCE(&ctrl->dev, ret < 0 || ret > count,
-				"receive_buf returns %d (count = %zu)\n",
+	dev_WARN_ONCE(&ctrl->dev, ret > count,
+				"receive_buf returns %zu (count = %zu)\n",
 				ret, count);
-	if (ret < 0)
-		return 0;
-	else if (ret > count)
+	if (ret > count)
 		return count;
 
 	return ret;
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index 3fab88ba265e..ff78efc1f60d 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -27,7 +27,7 @@ struct serdev_device;
  *			not sleep.
  */
 struct serdev_device_ops {
-	ssize_t (*receive_buf)(struct serdev_device *, const u8 *, size_t);
+	size_t (*receive_buf)(struct serdev_device *, const u8 *, size_t);
 	void (*write_wakeup)(struct serdev_device *);
 };
 
@@ -185,9 +185,9 @@ static inline void serdev_controller_write_wakeup(struct serdev_controller *ctrl
 	serdev->ops->write_wakeup(serdev);
 }
 
-static inline ssize_t serdev_controller_receive_buf(struct serdev_controller *ctrl,
-						    const u8 *data,
-						    size_t count)
+static inline size_t serdev_controller_receive_buf(struct serdev_controller *ctrl,
+						   const u8 *data,
+						   size_t count)
 {
 	struct serdev_device *serdev = ctrl->serdev;
 
diff --git a/sound/drivers/serial-generic.c b/sound/drivers/serial-generic.c
index d6e5aafd697c..36409a56c675 100644
--- a/sound/drivers/serial-generic.c
+++ b/sound/drivers/serial-generic.c
@@ -100,8 +100,8 @@ static void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
 	snd_serial_generic_tx_wakeup(drvdata);
 }
 
-static ssize_t snd_serial_generic_receive_buf(struct serdev_device *serdev,
-					      const u8 *buf, size_t count)
+static size_t snd_serial_generic_receive_buf(struct serdev_device *serdev,
+					     const u8 *buf, size_t count)
 {
 	int ret;
 	struct snd_serial_generic *drvdata = serdev_device_get_drvdata(serdev);
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
